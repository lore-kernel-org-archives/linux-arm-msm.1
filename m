Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E2305698
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522120; cv=none; b=Or8i8vS96Pb9ZsBEB41r98huypIaDtYZ42+YptjNquW0pdSeRtRJofBLoE0ZfSuL4C+qcVymBTnit4SXSVnx7qbhnOe+bYa6OAZuEgi4NC1oKPEh0Wl2nc+8VSGhSGsjWfvnMdbKwr6VRpFuwWRlkd3P3JfH7cxpKOFbKpH97Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522120; c=relaxed/simple;
	bh=6adOj+sayOFFGMhxlxyD3lCtKA34zphpM4plgy2Biik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8mkHYfJwrTVPPDJY3sYktMyBsTbUNRg0OFioPdCsMrdSAQslPG7885o0JSEh/Stx5cB4q2OVvirVetoQ51SKkqS+BAattPaawqj1+ig1WbTSyss08ffaOB98qHoU+jKkCfAZGKLI3gBzAH8IU07GqokslcT5PRL6SRuusNd1+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHCs9i0Z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHCs9i0Z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954df200ddso4627315e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786522117; x=1787126917; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCiZ0+Lg1HVsPwdFJlGKp0hyfCnp9vtiHAOF34yAXks=;
        b=cHCs9i0ZoyDGxvhOZVNd04N/+2RVOQ9rYcWyn7YJZE2sc719DLGOiXwiZqZgtdRY6T
         xmng9awigprfMjrg0W/KqhUQSOvwdWxwz9EC8D2t1Q8OikCZNGyvLYqGUr2GFb2L4LLN
         xCnTDkZlbB1Be8rBLPN/qKCQ1iLg8NCNzcBw5vpQNHb+ZX9+0Jpe3HJHXgqN3Hb8tQcI
         W8H0xJYhEpKpi6VwYe2lTCWt5Vv4+gpi8DqxzMdFoifvSIhq+Kp/YAdObGLAIzZSJtnE
         wr56oiY+ipcuh3fhgngzdDKw79yZo1X18WeAiHg38YSkHgnUgTT56g4XOqZVXh+iRcnw
         zZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786522117; x=1787126917;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCiZ0+Lg1HVsPwdFJlGKp0hyfCnp9vtiHAOF34yAXks=;
        b=Dd+gXDn9d0A8AUDW7SIO7KzZB4fwTRak+I6oHvB5vvix/cEsPxbvize1XSKp+lmp7A
         7JVriziG/XJ68L7JSZIqg1hNRr4rN4tMBEjX5Dyy5sSgSDTh3HhyMabZ0SpKCSU6q2gk
         c81bezG6eG1rcYX2W8LKgs+WHTU4ohDtLs9I4zem3vRNFWwpOtz/FA3Hx+1a6mgcacXf
         nTVKW4buLARp5n58IcTCYM4dWcuioXgGxuVGzSeDNXEsh9Jh/fptaInxoIs9QmC3GO8M
         BRmLKeuyO9lDv+fNAnHHcU8eWVsyVyedGUl48wLM/foFxlbvCWUR8FVPWVgUtRdXlCbd
         JYdA==
X-Gm-Message-State: AOJu0YygZlVJQ2fp/qRcXLVsWwNSqHHmksx/obIWiU08XeucpV+kmorU
	mhePK/nEb90oPbOfDjFpik941rBd8CiNHVArzXnnk9poyKewbVYRhr/opWlO6rV/l9z4/g==
X-Gm-Gg: AR+sD109OEGv6ZvjOh4CB4usQXaIqPTeziNm4aT33fyP6OQLAeUIkusFOZOsPf0kB2k
	3iatbWtK1q/LtVdQwfDr+LroxR+ChHXXxyaXb+X/QxHuAwkrMnr3a/H5FNppAX4d0rHA49Vc1dh
	xYeo82kQUPWVOHcTOGalwCAuXx/xxq+iiFgL2PenJgB6IQSVQMyU8ktl0BV/knXZrmWjgyAelmg
	UwBlKUc5tH51P5LrdRVDHehwZ2d4TBVM5AmBX4rN7ZlxjhmJqPax6SCUW7WiIehZTdrSXnER4It
	lZQPOyMYgDb8DQDduzCFVXoeqVxT+9dnSvXCYKdCyrHWldpOdlL8wqNDi7m6pKIP3JvONXCrcVG
	oNcYNCvzwDG2bFxoJQ5tlSB93sv9q50us2M2cLAx5u+eyDl7g420t9gyfXtYjZZWOppm5d63DHG
	dF2SDanhEtAd7bzYsvCxCFRfOe36rZywSBCHnUkF8VJ+NhPsEl14DX7FTOtNeughGTg8U=
X-Received: by 2002:a05:600c:c178:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-4997c0cd08fmr36259965e9.4.1786522117434;
        Wed, 12 Aug 2026 01:08:37 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977e882d8sm72814695e9.4.2026.08.12.01.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:08:36 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:08:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: [bug report] soc: qcom: smem: Expose DDR data from SMEM
Message-ID: <anwqAEtxD_t_epwd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konrad Dybcio,

Commit 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
from Jul 27, 2026 (linux-next), leads to the following Smatch static
checker warning:

	drivers/soc/qcom/smem_dramc.c:341 smem_dram_infer_struct_version()
	warn: duplicate check 'size == 264 + 6 * 40 + 44 + 68' (previous on line 326)

drivers/soc/qcom/smem_dramc.c
    291 static int smem_dram_infer_struct_version(size_t size)
    292 {
    293         /* Some early versions provided less bytes of less useful data */
    294         if (size < sizeof(struct ddr_details_v3))
    295                 return -EINVAL;
    296 
    297         if (size == sizeof(struct ddr_details_v3))
    298                 return INFO_V3;
    299 
    300         if (size == sizeof(struct ddr_details_v3_14freqs))
    301                 return INFO_V3_WITH_14_FREQS;
    302 
    303         if (size == sizeof(struct ddr_details_v4))
    304                 return INFO_V4;
    305 
    306         if (size == sizeof(struct ddr_details_v5) +
    307                     4 * sizeof(struct ddr_region_v5))
    308                 return INFO_V5;
    309 
    310         if (size == sizeof(struct ddr_details_v5) +
    311                     4 * sizeof(struct ddr_region_v5) +
    312                     sizeof(struct ddr_xbl2quantum_smem_data) +
    313                     sizeof(struct shub_freq_plan_entry))
    314                 return INFO_V5;
    315 
    316         if (size == sizeof(struct ddr_details_v5) +
    317                     6 * sizeof(struct ddr_region_v5))
    318                 return INFO_V5_WITH_6_REGIONS;
    319 
    320         if (size == sizeof(struct ddr_details_v5) +
    321                     6 * sizeof(struct ddr_region_v5) +
    322                     sizeof(struct ddr_xbl2quantum_smem_data) +
    323                     sizeof(struct shub_freq_plan_entry))
    324                 return INFO_V5_WITH_6_REGIONS;
    325 
    326         if (size == sizeof(struct ddr_details_v5) +
    327                     6 * sizeof(struct ddr_region_v5) +
    328                     sizeof(struct ddr_misc_info_v6) +
    329                     sizeof(struct shub_freq_plan_entry))
    330                 return INFO_V6;
                        ^^^^^^^^^^^^^^^

    331 
    332         if (size == sizeof(struct ddr_details_v7) +
    333                     4 * sizeof(struct ddr_region_v5) +
    334                     sizeof(struct ddr_misc_info_v6) +
    335                     sizeof(struct shub_freq_plan_entry))
    336                 return INFO_V7;
    337 
    338         if (size == sizeof(struct ddr_details_v7) +
    339                     6 * sizeof(struct ddr_region_v5) +
    340                     sizeof(struct ddr_misc_info_v6) +
--> 341                     sizeof(struct shub_freq_plan_entry))
    342                 return INFO_V7_WITH_6_REGIONS;

This is dead code.  These sizes are the same.  was _v7 intended
instead of ddr_region_v5?

    343 
    344         return INFO_UNKNOWN;
    345 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
