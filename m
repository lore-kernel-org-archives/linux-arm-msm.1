Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E137BE6C
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077352; cv=pass; b=Tc9wLjpd7NYNZdaNYOWPlsaWG+isyHnXld1lGR5pKG3ntGR/FgZBVRUJlMhPyQh+iS6RF+A25fi+WDl34hksaJ1TbANCYH3Gf6y15166MB10YOWEbZxuov9jUwce8UxBJ7ov6+B5r3JWRTb4fXwmH9BUxPiiU5MOb14WH4FDVgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077352; c=relaxed/simple;
	bh=IH6C2ITjynYuyHLytAInZHJ667Lrpx57dguMaAwX600=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOVjnh+vZgiuh8sZYJERcctY0D6FbYfuu296yhIPxTRfJr1CmU4/ou23NFkJyAWsn4CjfYQNyFc5VFF6rQw4nKhgZ2xGjc4/Dd3DYr3OEn7BgS+ThvgpEgu7c9BbUtenN4xYYL9Fx74+AxBfL6A6iP9GfvKio7hNgstA+ErVYRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKnu4UbX; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKnu4UbX"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2788722a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077349; cv=none;
        d=google.com; s=arc-20260327;
        b=pJoTnNJQP5S3krBKEIVV+vSR5KQdQg71hpfTyJvR54xCtDGH/9X5Cj7uApEgDnTEgI
         rr7vlLF2UPymTTpszUh/FRczl9oUOIMtSTA6wU3ekhTG+h+KxjSm5/fdbmFLbWDz6o3H
         61rX+eewIDXWKuAfW8ckrPWB1y+n2evS1qh5uiYxtvWJXR8AkzCBbOX33pM8TK+8D1pU
         BNdY8L4W4BnKvfe06J1CzjW7PTHODkU6opc0gUgft6rhKLcN5F1rAelxmJu6BpX3eF9y
         6a5JZLJ/QAw4FE8D2c87ooWo5qJi31SZdkNGe2c1To+bwxMlX8kH4VD35P4vraAUtttI
         GuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        fh=FiWmPLDJc/LH/+wG2dtDZb/Bo6fhVHv5ez9EE2Bnz3w=;
        b=bS6unOvOkTJJmBUaP0xcJy9Vry92S9alObvo+dfArELIsOtlGwwqYpEeePLXD2fRno
         eTUzuhsI2mIHspmMDgVhsdRosRuZT0IVXUogdTqsjB0To7/MNqshH9yGh+2N09FTSKWN
         uqH79/f9m3udBfevRijxlSFEuIbFGDaDWWeDI+T8EJefv+a2bCdM/qh7tGqoqfOKeFms
         F5g1A15rKCMhJRbqCwyAVPa8VTzuQ+URLu9lf4UjOuO5+cd8Dz+ONDyS64JXhLdb1MlI
         2yFeaDJORFMFtKCLH3nuscei4Xs37TwjlgqCa5cUpGO986ZmUQZpo5S3ieD9jtpU161L
         tACw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077349; x=1792682149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=nKnu4UbXM55FqTwsXsL5rqRbhxYX57pXWxdWa1UIfw/Csfnu/EABonwqCW41UjrO/S
         PBC8cak+s77RlztOUXxE0XyKjCDRZBaDuFgLcfuMpFXYXH6X3LnIUoZK/S/dsCQMGDTt
         DJ1nkmmtzlF+s72190lS6CJoMmrXM+kP6VhRyIKVmF1eaSf7HuoksALVwaHXZag9tbIc
         4NaavsXfG1fqgEbIqqPfjb/Txg6crHj+1zmHr2zHrt1s8mntv1AFLb5IBO/6kXlElJea
         QJnZyePcN4+yaZ2edvoUtAbu3NHu7uZbbDNTAs8Mh1AU2piH0hpBAZVpLGvA0CIN0rEL
         udJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077349; x=1792682149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=VovIjr+/SDOwJbZ/8JhGZXV/MdxztBV1rWb9nR3drwN248qVn8s+h40yUEadScA7oi
         4ljdVjoXnVhkNXsVEUA2WFczlw2Nzt24qcVRG4MczuY5ROKQiNt2aOUsDw7/9qzBz71B
         2nNCwCLDgbRGFg1niiM1JgtB3EfmhEMekWjNLOe0jFDOvTJS7PDNoPTmldtQISvonDWs
         QdkCT5ceRzKu6/7WjFh6TmljzmDfISVie21pojr/l40BJ/gSfzt3/B7TykNYAFRQzpgv
         pV/DmN8+AOP45TUiJKnoCFlpG3z1brCHSdAZgJCdZ1R7iVF0nZ8TGHmcyMG1XVU7XuQx
         ASBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzapdjcdV0HtlvECCnE0FPBK3zDgDB+DB+8BKvBQoPVYk7jhxYbptOgCz8xqSwxyt5khbuTO22EUhxnxfOE@vger.kernel.org
X-Gm-Message-State: AFq9FYL1OV/9clvVdsyXt6jm5CBH6mC5x6x+d8nft5SX76v6ogcJc0hF
	eHRbGOId+YrHk3KgQyr6QUBG5oCNLfPB6y3t2gkZcC6iLcGEBHM7aPIVnfgJQxlfAFqC9TnxaYR
	bAXdoQI7bgPy1MFjHESt8iHx3Y5hXx+s=
X-Gm-Gg: AYBFou0yWo4/YwBPs0dO0F/Ns7NNxzb6vMC063b8CVzjlgTphOj34o+mIR70hdSRa25
	2EcXTynwc3WyEW2XqoreptkBB22hAs0qBbZQ4B22LbSgguaeZt6xNUbxfyRTRP9CFxc4780dOL9
	AQ/wMUgBWHYEEFK7vFCVYmiAxNhnUjTTj+ebKPtMR5MxsJQfXDgps3P4CTMiN3qQfC2oE574T5e
	P2j7/xyIpdlKf1uSpfXhN17ylkGTTLBC1FeG67xPhPW3NP++zUudG5OBl6NYYsccT0blApIqd+E
	OfhYYchbn0aIkNn8jvBvJ6PCaGj0QdrkK6GqrSgL6XI2butFX15lbwt/AQvti3T7HSIkMNoByv1
	LEgKLFTjw1e4sSuE+zjpn/k12xTZrkged62ia45/Y/VA=
X-Received: by 2002:a17:906:c155:b0:c2a:d65c:c194 with SMTP id
 a640c23a62f3a-c31a9d56761mr1838328566b.29.1792077349343; Thu, 15 Oct 2026
 08:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
 <20261015051926.13752-5-sreeshankar0910@gmail.com> <179207236622.28934.8455006218721757519.robh@kernel.org>
In-Reply-To: <179207236622.28934.8455006218721757519.robh@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 15 Oct 2026 20:45:36 +0530
X-Gm-Features: AclHuK8CtOHEeDeQkZ6GhBte8PNJPOJgXaJdB95NIQjYT2X3-p2J5_V6n9AGVI0
Message-ID: <CAA-+uk+iNj0TxAkUgGSHhvBjDf7_EO_q9Zv6N1f+eoHBJf=q7A@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc:
 Document SM7250 PDC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, davidwronek@gmail.com, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, viresh.kumar@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, danila@mainlining.org, 
	jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, sboyd@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org, radu@rendec.net, 
	robimarko@gmail.com, bmasney+clk@redhat.com, rafael@kernel.org, 
	tglx@kernel.org, mani@kernel.org, linux@gurudas.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 at 19:22, Rob Herring (Arm) <robh@kernel.org> wrote:
>
>
> On Thu, 15 Oct 2026 05:19:24 +0000, Sreeshankar K wrote:
> > Document the PDC block on the SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Applied, thanks!
>
Thanks,
Sreeshankar K
