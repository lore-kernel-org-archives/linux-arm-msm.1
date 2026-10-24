Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792803990;
	b=ysp249ap3zBpU5QRI3LzOsbhFl1/GL9/jjI/xCVW6wquzfqZn6Ri++kRMKNW+kJj5NXf
	 DF5Mc91SwsTRb97arQVEVMExU+6JvYUXy4kl9hUitHyluxu72TFalxcnzFuNek+ZHJfvt
	 2zegEUV16L+sSXzj5z+8Bvax2ciZSvQrXnEZ6BFNrrpCmgQ9jEvdn78H2uEIQNxSZO1m8
	 XkuINj+nPSx/gs2ao89QNjZSFiTfD+lnypCi6sogWnUkIlB5BEY/ixj+J94PRgw4JXoh6
	 KpdYXEcNNCACUmpJyCTyXjil/LfMMFsI5bmN9mhP6S2tRj4SaRFjgc61+uTFa9YP4FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=VtrDtSvSzd/MsVzN8VNyjh57xRGFZ4SNrrMwIxuAHHA=;
	b=WoREORztW97WWhQ4C1hEEBZ+XcFFuGQf9s6xg84W+WHxh9w4cWo35saEcL2TLejAducG
	 v3V3/UBr6rvQ5+bNQBajU68+APyaQD9pUhpXn5j+yl4d3jVEsJMpyLQYh93zfQxpQUjEE
	 FGEKefEtkjAw4SgkAPWW+jEuXb3AwHUDarj9J0a3S9H1vDlJkxfKU723tOu1LyAauUdir
	 HdO8+UBr8CtZy/JQEI05crazaozciOBx19jb9+kK69FjOpdpBG7WauSF8mxdB20waTwHc
	 ReMyyoNH0INGJPZ770hqjS4Rju7ywWC7R28TxzmJ3csPWiI0unScahAS/G+u8dOO4Lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="nsuO/1yn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A609606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A609606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nsuO/1yn
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67921b515a7so1406100d50.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 18:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792803989; cv=none;
        d=google.com; s=arc-20260327;
        b=E/OxElMsPvdG77fwaDNQO0qTwEtM0fRDFzVjCzsz9PrZSkTmqjKrqEoVQBMLPDe3iS
         ii6FLgEo86iwbzqc9Q6u78d3swu7pNVW+x/R6u+JhqQSjYVF1LUGyg5+sM6j99tOpzwL
         ScE1yEXZJKgEaaQIZln9+pyIMreukHqJhg/8xgiXNIIs200++1NSkJBhDsk4O/1Pbdyk
         mmkwLEfwOyFbKZe6utohh1UGWTYKCmv/f1a01RMSfCIdzPqcL6VepRdjuBJjwfkLBV4W
         jRKlEI432i8bIh+nLkctVDp4R2lS3HxpD3T730k8CUC84jhpEb01m8bNYYx/azCLAWjy
         37nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VtrDtSvSzd/MsVzN8VNyjh57xRGFZ4SNrrMwIxuAHHA=;
        fh=hQ/e9OUkbGt1jBhTAVf90xCqKqNIXmGvzcp0rT/6lig=;
        b=c1VUk6CuL1Q0CMwCYsAIwAkAsjm2bndeAU+94Zxzea5E/0cScUE7ytHS76WMwemCL8
         1GXJnKJAfg18YMWaSmmYQ89yuOLkCg//8ZH3ibCEfcjqRfn1UliwK91DIM3bEG3of42W
         G68Dm5ifWH+9M6ESKjY22qguQpCpfDHLl2EGWHc5mPaKb743N+4T3hNTEMq9fchqzEDj
         +VWTQgqdFQpe3nZWkPTtWyPlUUBOYIZRRKCwtsxvOGdEK7cRG4VqcD5RPl9Bb/RGXF02
         mgWs8AOPSkIHJC4GVwEBS7apPUNt5j/o3GDxz58v96KqEDe44kABDNh4ChkzsdSR871e
         9NZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792803989; x=1793408789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtrDtSvSzd/MsVzN8VNyjh57xRGFZ4SNrrMwIxuAHHA=;
        b=nsuO/1ynOUByZ9oSBlL4XOBxm7ZdbcBfWT4uI9iAXiJ9r1hJVfTPTzjv059z5CcOf5
         Isdkbrig9wN+OvIqms4u46EpirBoy59mou17G9RTxowMxwfsRjpU4ZCTGIX1vIshvidQ
         h9gVuddOGw3Rycq4CC6SLaYwHlfSrPcgMdbeyc7zhWjvBsqn8MTo9o3h7Oicglpefbcr
         IGHHNkK2f6hE/cBQl1xCAdW48MspWv4nhtF2RaxOXk77E/Y4UibVD/beY+h1LmkVrkvT
         w1DpKQrbh3kVA0PKMPqEbPLg+TAO2R2//N9DOUV8MMEXYNXicMypn2w6V0mk1mz5nubv
         OItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803989; x=1793408789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtrDtSvSzd/MsVzN8VNyjh57xRGFZ4SNrrMwIxuAHHA=;
        b=AAYxso7LNv1b0hLRtCLX4jONE8Q2YFr3rTpfIvi1Jf0iC0a7jkTjY+mgkAEiLt57vG
         y++GsJ6XcEywOoFgB5XjMA3E9sWAKQT6DV2QlAtVhXiGc4RAhjy6XID/Fs9gUiR0x8ah
         xEPlXGpG1AvP+qu9jqXukf4J/knfXg2W0tbmhdzRxRYGr974jBx0z7Ic806brndV4MOn
         8tlo3BdmqOqsKXadU+GZ7AlbdWvTE6HtF112NEuU0WpF7MZjOGS7wVEmMiFK2V+gMi+x
         jd8KgXSViL7wzC5oxwN0Q/Y1bPTWSXFHJ03alKwt2O/08AfGw9TRc3NR6T6nEgI85YIU
         H+Qg==
X-Gm-Message-State: AFq9FYK4cJFx5OniQraGpeSqH+QhNW6vUvR3O3+57fIWqVtv/a1lIB5M
	utW7VCKAQ4+FzA0BnxdzEAlHitPcMi3kpXnRKJ5ovRE2lInQMTT2ieN4vX/v2MHYc6C5XjAOHjx
	NOFmFc4C6a2lpJOUcwroZhAO76jHljKvDEjimEuip1g==
X-Gm-Gg: AYBFou1XLt2ID3naxq9A8K/L2HDNrcktLR3QW64cNauGExnvIvCao8ZswxWuWYZn7Q2
	L+BhBn4Vzg3PpbjruNH9wpzkYz8Wwf8TBffA5nGcZ7wC5xGYUu8vrZY/Gl9OBk1aDLcH4RRNx4K
	eZvDR2uEi8cOcS6V3cpHkvUPn0v93+k7pCINQ1eJNj+zkmjq82Pxp65wmRN0LbiEFnfMyHM/MKK
	+WLKbwJ8sv3B8VmpO5o6BGRvuxR9pP34sx2F9lMzg2HhEYe/lfM3NpTPdM18N6QUVTQOxmHHAKR
	bxYBMljh0mtmJq3GT4CVFp5faN/+nULM0UNT/DWj0PS1ikKW0JGfW7lxbdmeg5ZESyxwQvcvYPM
	35xq+3Bsy5I62+mZEJm0FdOWtKZ12tu2VGC8m
X-Received: by 2002:a05:690e:140e:b0:679:5ae6:b290 with SMTP id
 956f58d0204a3-67a4518ec8amr688699d50.3.1792803989100; Fri, 23 Oct 2026
 18:06:29 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com> <CAAnD8RaQLxstSjib-521b9fTKgzDnS+x84rLZeEYT=M=D5f6gA@mail.gmail.com>
 <b6980e47-710d-4e55-ab2f-d57ad5a1a371@oss.qualcomm.com>
In-Reply-To: <b6980e47-710d-4e55-ab2f-d57ad5a1a371@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Fri, 23 Oct 2026 20:06:18 -0500
X-Gm-Features: AclHuK_3HBxKIKNNizs4WJHfUF1sNZ6tmw62BN4UP79bfPxABqJT2qXs-xAfFMw
Message-ID: <CAAnD8RbSquKYob=hjYX8SO6gO0Z9xfrRoObf9q0Np4s9qTYUvQ@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

> Timing.

Thanks, that was it. With CONFIG_QCOM_CPUCP_MBOX=y and
CONFIG_ARM_SCMI_CPUFREQ=y, scmi-cpufreq probes and scaling works:
355 MHz - 3.42 GHz on CPUs 0-5 and 355 MHz - 4.03 GHz on CPUs 6-11.
It also keeps working after s2idle resume.

Jeff
