Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFB391E74
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407193; cv=pass; b=W9hlGWUrTuaSf5/mcMSu5J1eE+1zcYnaoliB6ktsldSDXT1bMCoRGXqIucr9sxi0VGthU5l+ur5UN0WSn3KTiDT3JrPDkzd809ejh2FrtZlBS29cEt7+ewTvKOlOXQzUOOSfXrisZ1PwF+J2lxhmTnZ5GGtlxpRW18tSH1t2Vyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407193; c=relaxed/simple;
	bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYflE6O+ctokUnscATLGhctTeaeGuWtgpAF+8HSZ27J79Mwf0hSkZnNlbsgpZryQuhi5SgL4TRMlGaBwiIn4vGZlkTee4Q+AULWEC+TivMpAK1bONjV8Oecf7LhqxipbY/96+Rb9adpyqVDWNbqeTWbNTPkdFZfHcNjdBsOs748=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGdxrMWr; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGdxrMWr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so2466600a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 06:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787407190; cv=none;
        d=google.com; s=arc-20260327;
        b=shvq3+U/Ymst+0pJA29k66/4kiMSDp+MZJ5Zu4UlDIr/itftJRc9fqVd66Zi1LH5e6
         F29JuPL3QYEPlH7RozTtnUGk25BzVLBZveJTLNwRylFr8W554mBtSVAMWVowzHFlqhxb
         +Lyg6HzletJhqU4FBQA8T0lBMb5vHKxgVY9qfaVfwS+KLiwsxrdhH2jaBVJGg22If36s
         p5J3uHwmZ2GwD0UyxL76tY3RiK0UBaJA8boX9sN7VpbTAhkO3EuoZfUh8ROvAhHTWZzV
         X9tLm9qiJa3ShfXf1V8csZJuQ6GK5bKzoRoMAXLDINrjCOpAc5R8c6PO2vPCnp9T5DU8
         LJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        fh=um7MPIddhLsuKKsyZ8bvGuqZN6caxisEfF0r1tYbgoE=;
        b=IyASnoLMwj65h5SIlQPIiseKHyUe0lYITd+S1VsvTb54A+gC3VDMSqqoHXr8vfqij1
         sCgYYeH8Ev94Gqr4R+p48CLeX5FqHhSsolh02WYpM42CVUhwoaZUcShR4LyopdOYXy61
         B4abtN2ZiPANCKUwfTFu5Y5YE/+T/YQGKb6Xz6TumTwcrBxE4wlU3xPEceTs0hlVVrvn
         qVyVSySYefwMddKrXBBV2peIzgIDyOd7ee2Dob9mjPYFQWZVxYw7pyvx/Md/DgB+1Ncx
         oGrMgcwABEmoUeiYXaGeMppoC66hhVxqjFMwsbJg1tWFuxGRx4bfmNQydr+xLRnOwZK5
         zENQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407190; x=1788011990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        b=TGdxrMWrCrceaCkytD1HeWOuKVLxQNvlESnBiBxiO0VOwdPWRdQmDpcV8yWvh+Cub/
         IMDXIpbYSfQIDXwCGL2g3wKQevED8zEXiybvj8XkBqn9TlJOkyRFb4xLh41fFQ3ISnPw
         phaV+zGPSpZ1OFFh+KPHxEkwL+DZmuQV/L4HMCD9S7KeX4+bA2zXLUb0jdyUvnLqm536
         Yc3HOrMGPUn6w36h3Yx+FagLSVy65Yd8G5llJY6koyimhD8zt/RkHaD2Io7E4zqux6w5
         qgdTX8oQ4yRwrCvWxqy6EjL+T3SC+y29GL9AWvKMXRfZtElvt5wjLk4SXxv8D2MkWK+N
         Elcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407190; x=1788011990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        b=jdxLDp6j94MoDmGSMBo4plqBTl/ivo6ePvcYnWBmNH6NptZOQLBicd+N/lxR5wjMwz
         BNyVz3skofV5wzDAUjzJCHxFhQN+YItpcVgwdxPdppMz78j708ZjrVSF8VvgGSK294B8
         tJrVCK3IqDT1YQJVkxf2iIABwdIVZHY12J9CSVRIpD3rIuMxo01rULb7i7Tnz3FDh0aW
         wUyEM56pRXL3ZZCNC5pn1Eg3iQOHQERmldLDOcnaCrxxPIBNnYydsOTrD5zycYF5DPOy
         Jq60eAYXyaCh0PYNlbDpLaz39H/bqovaQmCVHOEaYedRKVITsY/I0ZPh1ua4dSROzBtQ
         KR9g==
X-Forwarded-Encrypted: i=1; AHgh+Rp+KgJHX3qm4RiOAkdS6LB1MeY9z7y8NtRSAfeSAv4+bd/Hgph/Biaktj7njlkb5uE1PjweIvpcB3OF2/vx@vger.kernel.org
X-Gm-Message-State: AFuF++ncf0NVBKMNdVsrWu6Zb0fsFfLwcgjW5OopnoPHDspj+MLPQfs3
	4cjVORXmjALDADuIjgM0M7cy4znrr54rlIGVQ2FZvqj8pLqhnYxeTQvTkNLLDVyXLT+1/C9VjVT
	CvL4FA7gzxssOoEjs8llgTtoN2wMLcIU=
X-Gm-Gg: AR+sD10zLw+laNbbSXnCz5QPIFo+TB7zkNWrSkF38V7/ZjSQhXQqBnv41bgPWd0rYAC
	WJJMVzS7sXJCI2+ocZt31z1BiRjB6Qy7En4WOVjgBDJsDLci2f4sVkhltusuBNR9dU/eb8tgiUI
	VAQQlGIStuspkYK0NfTt0QaKoofj+ww/cTGRoknp+gS5V1/PixIdjKEd9iKHZ0H5dgSQ6WxxXPx
	E63NbIJUUoqiybXU8qE+TnaI/c5mzv+sgsEzce/13Qm3DUsHAzZvkiz+cPznfbNYhjcWjo0vTGW
	ToNRJhqok8LN6rcD4WD6GQwk0B3VWyo5mkOJdg4U9HXykgsi4TGkvYazXzLAWE9yAVNe1anT3C9
	en3MORwk=
X-Received: by 2002:a17:907:c8c6:b0:c1f:1520:4de5 with SMTP id
 a640c23a62f3a-c249257c128mr661278666b.1.1787407189637; Sat, 22 Aug 2026
 06:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-6-sreeshankar0910@gmail.com> <20260818211749.GA687014-robh@kernel.org>
In-Reply-To: <20260818211749.GA687014-robh@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Sat, 22 Aug 2026 19:29:40 +0530
X-Gm-Features: AcwNN1UInbL88MEaThabOx-Pd2MTrrUX4H4Rd5JSV9-PnyAPj2dgucrt6K9bcJw
Message-ID: <CAA-+ukLBfgWVf5Gf6qmX3_t1MsbuJ0hFshGfZzi0H_+HLWkE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC
 bindings for SM7250
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, lpieralisi@kernel.org, 
	quic_tdas@quicinc.com, danila@mainlining.org, davidwronek@gmail.com, 
	robimarko@gmail.com, linux@gurudas.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 02:47, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 08:07:47AM +0000, Sreeshankar K wrote:
> > Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
>
> Missing tags.

I sincerely apologize for the issue caused by my action.
I am new to kernel patch submission and am still learning
the workflow of the patch review process.

I have corrected this in the new version and ensured all received
Reviewed-by and Acked-by tags are properly included.

The latest patchset has been submitted here:
Link: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com

Thank you for your patience and for guiding me through the process.

Best regards,
Sreeshankar K
