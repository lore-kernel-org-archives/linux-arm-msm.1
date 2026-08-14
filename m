Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2313630B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786732822; cv=pass; b=KdmWAQ67TfGBo30BCIZ204ghiLRthnxxyzGHHfXzsiq+otrtbTpxxYciJLL/F/xL/Z9BSMKAep+yH0YG91nBtKajJ6fn6hLnUaAKrPxXPcbW0TBiIg3N0YS+LLASi0K3/k8GxLxWFqwve0xmSXPv7sAL7pjKAY1df4cLA+uB6Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786732822; c=relaxed/simple;
	bh=8d5fIHcGxiBmuF/sD0uaRboGKU+fIylTceIvjRas9vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkK9f35YkpqiHWGPbGVIhxJ1cR3b2v+74N9UpnzQv21CAmdk06XuJnHTN51VsddU/jX1kyWJILs2+aEbrgO4O/rIAV5pRfjo0x3Ccb2xowGAe+eeIvCu9Pc184xG+XTP7TijfOv0bsO1m0Bueq14c/Dg0Ghz/snkf5tsKHsDbD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyH7j+e2; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyH7j+e2"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1321319a9so11287081fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 11:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786732819; cv=none;
        d=google.com; s=arc-20260327;
        b=q6RRA7AoFfJ6sBomP53elZ+gjoZAPQfd+a7xrVqRxIUEOQhFROr9/e2VWwZh3Nsli/
         I4VIZB5EOHhXnBHfrX3TdrsyXb0NEe3QgEZpcJ6W+7CoOwOnxeH5g/EeRtYEvQqm9Y58
         Z6HPNkBPMsAnPY/44HNwQLxgngS0sYvNIW6y8lC0WLUziH1JH4OIfyJ6ZU4708U08ECx
         ht6FYMo5H9wdcOiM9Cip2JZKO0+JclDRqyF1cCOYcs9GqHkBdohRxwK9U6qJ9Ld0H9qr
         81Q9sAdC8gA4qc7wdnGW4G6XVSp/8hdmBKGBHkvp7TqHSC7ESET4dPPqB5bOEPgeiB93
         s4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ygIoIg7RActdGA1L4Eix3cXFvKMcEifV62JIap/v9w=;
        fh=UNUNV+3Rgr2p26hylWe/96oGIAb0NTSMds6DDLf8kQ0=;
        b=ZU6qRKjr70pMUGTQS3c7AE4NWjIb+q8m+mGar28sxouczi+pPhBWjulrVRBQu93nmZ
         AXmd8P8is91u+OUMr/V6ZJoyYHU3V7Jp7/QEY1+pHZBXNGzduzbw6wOEik2PsMpq24t0
         d2dMLDEWV7ubswaWvwVTu6MCN9OIFIpqbBqOWdRuo2x0AgrdyZqGrIKCl9IWWEjmHoH2
         fGoRFVddf/bbR3eBcTOTaGPBsnzN9w4GH05bofVJ4jjAhysOE09duoYwyDS3IubtwJ60
         c4ye7LuKgYmR1iNGDDm2MHEYqfgGK9U2Q2X79LVM2/r8xcM6l18UXdUD0yB8rXvB5mac
         NYwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786732819; x=1787337619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ygIoIg7RActdGA1L4Eix3cXFvKMcEifV62JIap/v9w=;
        b=cyH7j+e290opi1nKETwybhOAbfjV8fZeWVYYMOuytD15EK6ELGXY6HdGHx+IrFWLmm
         MhxSsOlPPURztOm3bfIIz2zMGjhKkY/76KR/eMoTHWZP69l6lHc9LpNkfnxfq4YmXN0o
         sUF7DgsmD4w1Ux/xqG4o5QQ5+0sXk40u/+o2PJT10ohhbxZDSZvDhzMB2tUX8kLErDaD
         aCAC88LepO07iW/zwoWl+QeV5/CEo6UHYpJzieA4zsbmJLJ4RNDJ8u9afnJM4qF/rurB
         +vvvfiO9DbrYjzvDN2iV55JGICPmM0Gc9fZVePlEEO5xPdu0685+FtNuCDlEyhOtAUTr
         peGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786732819; x=1787337619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ygIoIg7RActdGA1L4Eix3cXFvKMcEifV62JIap/v9w=;
        b=r16vXzBk8nwTpQSy3+gIiUnV5y+Iz2PQVxk1UbooMab2G5TgxAHd0hWb98+58x00ss
         nqXJ4xLJYoJxc1LJjsJ0lK4BKoAmkl1J3X3BMZAr5VO8y5qN3mt9ECKECMZTQcQD9bdk
         uaGnefSS4MsTQXf2zwdItNj2fIPgDVSoytk/NRLeAjiiLMBjaAIcjLohg++xhbdnJQyd
         +y0QaykXE54gk0fiGB6QouZSs9oV0s1Phn6sq8k5MRu+kGrjVqTQpOCsObAmc0P4DUb3
         IOSqtvVz/h6SalnmG7hS/+DKmEFdfmRcvqdaITwhP13QhFWPtMmIWtKiye1LN6VIXaNh
         BKQQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/kKcyc1++MT2PuoWeOwEuSWI12AFcOOY76CSKHo5j9X8AsICct55ib7+ylipV6h2mmfh+is0uG/6cmEQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw16rSqpcnw9umu6WCFOjzFclX+VMb8ZMDrsJDtj/8Xg5fIHVYx
	Q+YcOsMq3TDrtNbSy3zUBcu2pfYXdTkxDDkXCjZxIYOTKd2TQ4mvkslh3kYfWX8l3uFo0Fs5YXb
	d7XWnZ8oN4kAR58QHw7NhyeyEwcZ4C4UsUQ==
X-Gm-Gg: AR+sD12XTMDCkeq5kY7KG2JU6uGFWra/vsimTwriOsatjlrd/rd+fMLNq12jkNiPpe9
	2gi5s/R0BBmQNsi0hYkpzoaqLj+ALO58E2GB1jNZrwMxnf92SPemT1lQWqGuSken1uqxYo/Ysjb
	PMjJ26NL3MaS/KbXZGMJ8uyRZXpYpGwpA7p8oL04v1U9KaoP5Fb6hkUW9PxqMZln7dRkIbWwmQH
	w/4JQxSdiW1OFM5VZcwhJ3UdEQL0zYUl0ap8/fJqlE0p/cE5xyi5nAZmTyGpu4XNnOL94d9xFu4
	Rr5ozsdfVA8o9Nj4+hwZbiTW/e3JTuZEO+yFV5S+PnQUf3bkjGnDrH8o4oO4HrwN23ZkatwiZKw
	G2FA5inmdJZ1C7bFkD550XUV5yVYqsls=
X-Received: by 2002:a2e:a54f:0:b0:39b:15b4:79ef with SMTP id
 38308e7fff4ca-3a13249d4afmr7736551fa.17.1786732818596; Fri, 14 Aug 2026
 11:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-2-a5a365ba3dc5@gmail.com> <20260813-tuna-of-pastoral-mastery-8ca99c@quoll>
In-Reply-To: <20260813-tuna-of-pastoral-mastery-8ca99c@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 14 Aug 2026 13:40:07 -0500
X-Gm-Features: AUfX_mzDUb6yCmFQOqV6Z_Inwx5K-nKduw5VZvYKwLZcIntAcJyWm3qdaFbJMHE
Message-ID: <CALHNRZ-jfdscwM86cDK3ya4XC5pKVm5y+ZMcdoDYzowDCmF1MQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 4:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Aug 08, 2026 at 12:37:56PM -0500, Aaron Kling wrote:
> >     Namely:
> >     * Nova
> >     * RP6
>
> Nova what? This is some cut commit msg.

This is the same structure I used for the matching AYN commit. The
vendor is Retroid Pocket and the product is Nova. It's marketed as the
Retroid Pocket Nova. The vendor is listed in the subject line and I'm
listing the product names in the bullet list.

> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
> > index 954be28203017..52ef669d6fe9b 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -1161,6 +1161,13 @@ properties:
> >            - const: qcom,qcs8550
> >            - const: qcom,sm8550
> >
> > +      - items:
> > +          - enum:
> > +              - retroidpocket,nova
> > +              - retroidpocket,rp6
>
> This goes to the existing enum.

Ack.

> > +          - const: qcom,qcs8550
> > +          - const: qcom,sm8550
>
> Best regards,
> Krzysztof
>

Aaron
