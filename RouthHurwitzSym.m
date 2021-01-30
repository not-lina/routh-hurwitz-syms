function rht = RouthHurwitzSym(G)
   syms s;
   %check for stability
   T=simplifyFraction(G/(1+G));
   %T=G;
   [~,d]=numden(T);
   ce = collect(d, s);
   coeffVector = fliplr(coeffs(ce, s));

   %Routh-Hurwitz Symbolically
   l = length(coeffVector);
   rht = rhInit(coeffVector);
   for r = 3:l
       for c=1:length(rht(1,:))
            rht(r, c)=rhValue(rht, r, c);
       end
   end
end

function v = rhValue(rht, r, c)
  if length(rht(1,:))-(c+1) < 0
      v = 0;
  else

  ea=rht(r-2, 1);    eb=rht(r-2, c+1);
  ec=rht(r-1, 1);    ed=rht(r-1, c+1);
  fn = [ea eb; ec ed];
  %dt = (ea*ed - eb*ec);
  v = simplify(-det(fn)/ec);
  end
end

function rht = rhInit(coeffVector)
    odd = coeffVector(1:2:end);          % Odd-Indexed Elements
    even = coeffVector(2:2:end);         % Even-Indexed Elements
    even(end+1:length(odd))=0;           % pad the end of the 2nd row
    rht = sym(zeros(length(coeffVector):length(odd)));
    rht(1,:) = odd;
    rht(2,:) = even;
end
