Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BC54DAEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094393; cv=none; b=UQapXihdd+YZOz7rLKzq78F1Cz0IHavMGwUQhDxV56583smKVkC6kPFZgyde7JPRWPo/p4z0YUr7nSdsA6zrciWBC03MqhLPB/mdcVnvtP2FHv114T7BAgeX9X2zABP1BQEdJbXXiqzF8Jn9662ETI3jFr9yq0pf+oF8v8M8LXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094393; c=relaxed/simple;
	bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AlZ3G6lj2pjm5LrAqxqiMC12w2djZF3yfAbVPyWYS6WnUuiDnlNDSiUOjjE7MX5m7SFL70WJFTY8XBA/S2U9ntfPm5OzKAhErggzlKHg1MQyXAQK0MGmPDwYp1F7K/ddG1+oH9fBZRAjGpBKu4/+aoEiym3SM51PzfnRyeQ+xNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX5e+2oL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX5e+2oL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c399641so54784695e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792094387; x=1792699187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
        b=bX5e+2oLLGmnDT4eygYVPI+WL2vPablSu3iY745nbvNTQcTZfpyKUn2s/lE/9mNvxx
         YsnC9Qgry6IR+OHWr38KGEKYK4kbVuOszCQfQ70lcb1nmZ7PMGrmDLbN9pOj0IpHhmDF
         BUYZNR4x1vPu+/I7aQvzRwYQ8sRGeUlMEf20iO/exmXC5Py/YgMB51/Zi6irvyqCp34B
         tb6vhHr1fwrMQ3Ocyi/dk6i0L0kF/jG2S6/jETxBMmmrm6B96RdUmj6YS2V0KrwO77Ku
         t0SP1drj8qORB51cF3+mXj5Psfds433rID/RTBz4XhC5SxL68dR8Ku4QQK3YVEx415Jf
         Z3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094387; x=1792699187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
        b=W/qumVFMsulhxvQH+Vl5Qn4Z5zyUUb6jkVukTIeL3fklwn2w7rkxwXvgYwwDSV+STW
         +KUHeAtOYxueE2PpbOWcKoSqHEPDmxflA377yphorJvX2Ff7cX+61YMEeqqRogufPslR
         Jm2B9AA3u4uoh/SMeGcXpGdzbUlVsTYV1IizudWQrctxDP5Fc1N4Wt1OoWPSUWgvtrrf
         dPnGwGhBzD4nolggUvOVrXtARML5paBdyVhiuuch3G6aAbYSx3MRUsTvU7WsiIC/O2Ih
         yfvciTHYAPUXbcQd1+lhMKFpXFjTteZnTarkDiac5WbU9YhoklXQFGL2XuTmIqp6n/8j
         ro3Q==
X-Gm-Message-State: AFq9FYLlyf8NsxS1eK+WRNKXaHELekJoE/TwBnjtZa4hrAVpYQNpFGWi
	2JaN7qLBqHQeg2gXK8DvhmiUwwd2ajg+UPgkpUnr8x87v6AYsUlc+gOh
X-Gm-Gg: AYBFou0VilzWJsFnUnxPGq1W+kWRZFM+ypzGuN9MYBeuYoFNAZb9ZTOk07S++wTDGot
	481iQEZsW3UbCw5WGV0gm4gUdIhWyInOSaj5F1H0D4jXPrCA+mxFtFf9v93YXeI9PFv76F3e6t8
	tDjle1LzrPRBxki9nz8LCkCVTv1rC24FK58i3B44fQL6le4CXLsLW9IvEYSBc3Wkpiie0lygQk1
	9JO0/nrhwXZjNsRSSOpSuCOQKlGeJiGuaBck2ddYu40piffOq7trLrhi3CIxUSX6BRpaWG9PLdA
	v1nBataJSItAf97jvcyVD8NokZ+J/cH9ZRzQ1CBqxpFMU42PyCVvXYkl849juncIDX21S3FoP1l
	PPRjJR66qlUlCOohoW2wEGLJyL5r6iSHMtWtqdAesD71C44hXU7Ui7GAhHegdY5270nFuHXaP4H
	nCLYhyfx12x+Lm+sbzX7zxfpQlirckOmDxw10ijKXbCZKM0PN9Jb0z5/cD7QqjLiQuhRTR+assx
	A/lajRDXUOAah3yFP4Q+K0=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr205111165e9.26.1792094386716;
        Thu, 15 Oct 2026 12:59:46 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm202635f8f.1.2026.10.15.12.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:59:46 -0700 (PDT)
Message-ID: <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
Date: Thu, 15 Oct 2026 21:59:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Language: pl-PL, en-US
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/08/2026 22:15, Dmitry Baryshkov wrote:

> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1

Hi Dmitry,

sorry to barge in but I just wanted to let you know that I 
gave this series a try on the Motorola Moto X 2014 (victara,
MSM8974PRO-AC, PM8941 + PM8841) on top of v7.3-rc7 with the
msm8974-mainline patches and "clk: qcom: mmcc-msm8974: add
GENPD_FLAG_NO_STAY_ON".

Display (command mode panel) works through the MDP IOMMU. The GPU
works too: the Sailfish OS compositor renders on freedreno (Mesa
25.1.8) through the GPU IOMMU, and I don't see the reboot reported
on FP2. I tried 3D acceleration, and it works without issues.

Hope that helps!

Thanks,
Michał

