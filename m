Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD13B6C09
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179612; cv=pass; b=FcTZ9zm/sTQErXkbeAvsYiV3Fq/2YqxTzSGWEvkySGINLacQyrWFVW7KiYmv2OVKXfZFT7OUI6Yhuy0+dtUhNClQ4QRK1t6x6lYxRo8GHyhlIT26BcJqcSqGfXq7Sre2zwMMWOCfF9x1vB+1daSOwV9PNkNoh70yB4uo3cJMFes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179612; c=relaxed/simple;
	bh=mCxucztXJVf444ctC1d185cDxrXRV3J8f3U/5bxqLj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfUFIYSu9Iw3/SZY9cAXAG9rcE0rtVmS2WJikZmnW73n8tct96d/tsJXSjRpYlDQZpmwRJEOvOBNugauktCof4icPAix6H43ieDVjmf34f7laVS2oedQkJTYSkT6+ITMQmCy5Q2tOnxTIb3pKGUnQOOdzY0s8DHwWiMEy1SYaK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DauuedQw; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DauuedQw"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84847482584so209683b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786179610; cv=none;
        d=google.com; s=arc-20260327;
        b=EKDKsFwkL2+N8dCKxyWCxPBFZvkGOXGTyhIDdmz7KkPozVMCY/SgAbLqlr4Vr1Qqgs
         XXa0CGDJSbvT4E3AntYPPeSmikhzYBzfZrBemBLfkQ/009COqNUk3fh+0f+AMb0v+yik
         q7NagiMeKTCotHnJk7vQYtxNyCa1jAhXP/Ilj0LxT60sAkgV+sS3cVTj2ypiyMAjffuH
         SH6zstD9TfcNRDNY/D7aWenm0M/mgjsQFfYUoEQXe9aIHEewJPTvn1tWiOoMXkpCc8EC
         G2NClIqL2i31PPg5e8pJufzRLK0dsAgakrF+8i0A/RlEo0KWfs54R+gwtyDa0H4VFIa+
         yEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        fh=upakIaepBvu6c9vpif1VJ+hii3QaLDBcyB/pchYJSCk=;
        b=V2mcjcDWHK0L3XDqoX40GMaduX8z0HUjlmh1jveNqSJIYIFaVWcgL2ruJq1s/x8bwv
         gT50OMaMOP6HCHxflQ4+tk0LhZAgzqzwEgjNXiMzmOgarvzZ6RXSclT6vTVSOjp9vB2u
         BO9YwZj9z0XFJupwTAGgjfBfJZ0bAlzS6oKlYwhBfs9LFMGKg2w1Ugiomj8zNDfgBlJd
         ej7kuvYOx7MBm3N8011a/TcJ/eJgrAgzIg9O1A+ozeQ2YwdhconSjJuYs+Xemlv9Bcyp
         iSGqF8tjgh5TgqbSrKl2ItL+zYGz5cu5KrXHcY1J4PRHiDLaFQ/wvTtVcWnFInzDAjDz
         /SiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179610; x=1786784410; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        b=DauuedQwmFshzIx5UXK3O9h0hq+ZgNABttSfoLR40ewZPKh6L0iweJWQL3O/1GTXL8
         iVDBYgKAUhMXUepVcNELqn697fAC4mBaFdK1Ozge9mful3GU52ZDJsiTkbiBmpXgcd/Q
         mo8lskOcISthLlBgZLAQOAXZkIVZNZ6VuXweHQs+782d0ihbrcO4AwCkFgpenKaau1iv
         BeXV25bvCsOEv3P+G9rAi1dmv8HVe/dW7DQg81eQQc2DuxDaP2Lx/8s+AkilGesF2a3B
         Ng7LL3FZWM7QaV0Rh2Dq5FtRV4lTxBsBKGoNm71kkDYNcR/xD9ERQI7CFU0+lz856mWS
         wKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179610; x=1786784410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        b=T4aSpZz6WeNan7pIsQF9RpGNxLu9xM5TxSnAGMJKiMH6gPEMiBH6Y2W8nDPJyR59OV
         6DMAndmG2EB1StYceyN6KofPybGoqpw3H5rFXgcTuzVU3NaMJWvEGeqZhNtr6f9mGcyk
         7WjI/BCOPwhcFiznSOz627B0mRkYiuroSD2Mm3xJSd3P1Q+aDRGQWmcbtHsV9yShHvRS
         cNBayQCcDq471DxHGOCtrLBkGoO5QUWkxQkjOZ+A6QC7+9/NapiVGGUdkuErcF8Jm7WL
         fXZ4JhoDytdNpjZRrFKmbsAcB1RAD+sJ26HC6Onl4iu+ZDG+p7SL5wY9EEgS9EQ/6gXM
         nvYw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8H2YeaJKQSdzqTUzuJ3chGwPBKYIGDGFq8LdjxHOrW2Oxe4VjLIez2coZP6FSOPKH1VHNPrU+ULTzBVVm@vger.kernel.org
X-Gm-Message-State: AOJu0YywjWMIME4n71NAVQZWQkIQDacLX67Mmcqz4pZt9moW4xFkpoPA
	xAhpR1Ox5YkJNg3pCm9Q0mQlGunDaSjJf5/v6HHhyFuCoM5v75Zzkt694oqQctf/o4q5bISQqCF
	Zn/QHEodDQAedparK/f73jO+At5KTNUk=
X-Gm-Gg: AR+sD13F8QEWibBNkUxekRflpjl67uqtxcrn06NxkSgrlREmqTczFafNzqQqUK+Kovf
	md+RChbYoKNR1+u/hGYdZJPRE8CCebS3ce5BSfS33Q4mUyjtCmQg0/N8RErpvdzsrI/dbT2b/IW
	W4KnU6Fd/nuJj/VSq/7XfPYBBRlMhkySAO6YU0gFpcjKFRBSE2aLjimelOG0Xu4rfZAfPMnKxVU
	J7TEXBWxgxevuueAWPSCJS2s9c9ugNTWmV/RffLhaN+0L7Qr1DAMpQszC1P3fQc4JBxZlNix5Bm
	N5kBfTLm3GtoujYXgTTHOyj7vgAW7Ky+8lh149FLrHTHmM4zyxs9nPnaN5ZP8atUUmqwH+t6pq6
	iCyVlp4dvrwzzIqkmONIEPE0ZKeb36BWbOe3KwdtSHuMSj7bERFd0JcA8PHQCJmtQimq5vzqeSl
	8HhFap5pI+ZSuEB3s=
X-Received: by 2002:a05:6a00:4c98:b0:847:e2e4:a36b with SMTP id
 d2e1a72fcca58-84f6b879bdcmr4679831b3a.19.1786179609674; Sat, 08 Aug 2026
 02:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
In-Reply-To: <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 15:59:55 +0700
X-Gm-Features: AUfX_myHjaHhMRuATtXSNJb3hMWPktXUxThFKw4KnDmx30oADvzEsWx9LpvQM5w
Message-ID: <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thanks for the review.

>
> This is wrong. Check the if() path - the code ends up here if pretimeout == 0,
> even if irq > 0.
>

You're right. I misunderstood the condition in the if() path.
I'll rewrite it as follows:

 irq = platform_get_irq_optional(pdev, 0);
+if (irq < 0 && irq != -ENXIO)
+        return irq;
if (data->pretimeout && irq > 0) {
.....
 } else {
- if (irq == -EPROBE_DEFER)
-       return -EPROBE_DEFER;
  wdt->wdd.info = &qcom_wdt_info;
 }

Best regards,
Phuc
