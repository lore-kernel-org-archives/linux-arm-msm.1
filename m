Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C973A6F17
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 06:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269711; cv=none; b=XUGO37lITy1UE8G/vJFy6/J4GKKFTFW40B/3XyWqUTfzcDoVXovv4z5TdKt44FAU1mJOWRxA+3DhojqMr8iDRDOYlXbNopb308zfU9Mj74Q/Yarea/YisIhVscEiNjfO5Yz9QO2pSVceoHawvIT8O7f01+2LqkVnyQY3WQ8YJ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269711; c=relaxed/simple;
	bh=7dKDDP0i/mrrGmWLytyyROiGlnWcBLYibhwQwAadghA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNVhn4Lzq2sg+yclX9Zx1xIs93sMJZ6Gt0X8p4a3KLXz9ulQXFzaspx/8/5fj72h3rNqR75YnGzrbLFB0Z3ZSf0k95xAoUFeX5WZGLTlGQt7ApGuZi0E1UWCSkyBpGfk5aAw3vmUT3O1x/hqP9KxKMShRq2t5MA1wjoWp9x1C9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDZqlX1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QahmM20e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDZqlX1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QahmM20e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e83h3903097
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 06:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/klLpSgzFnLd9VTNITlyPIZJqJOaOloP8mGS3oXlikQ=; b=aDZqlX1tlbtC7s92
	v09FL/s4tnWEIRpYmhhf4OT0QIkc5dvDvl/0GvMfFZuxju0XJWgFVo+WF+jvHv4i
	F4kHDtLdEEhC1qDEMP0KgEzJ/VIHdrWT7DWQ6F4r8y7Qmn01wrY+DUqizG0Zh5Hc
	8aZtssO1dGzSzUJ4X3Ijb4DuX9gMIyQWL3qWYiyl8ofiWHwn+nEZB4Gcz+bGlrim
	fu8K2dEX90JZH4LCKBwtNK6kJZRz3UNk33Q0MBXAsSY8MFa4PQm+2F2FyCz+DkCP
	0whJYmisVle2wfRbmQr/yg1RhqCz15P+yBgzlkfD0nT7J6rV1ki3FHb6Thk0mnJs
	rGaWow==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dv2ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:55:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf71bbf197so2327563137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269708; x=1791874508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/klLpSgzFnLd9VTNITlyPIZJqJOaOloP8mGS3oXlikQ=;
        b=QahmM20eRxdJ+jFUl7Poh297Iu6d17xzzBHCZSM93Q7WbPUAuCkOaigNlfPvl+SoVR
         mwpAXc2/4wF6XJJSVugs+ENNO/6dJnDmnGvsm9t1j9GRA/KhkoHneyYO3/l5BB6Wiv4/
         KCtDHailwiJkBZkhcOm6ZXrtLg4TugIyHF3z9xDoSn8D04TtmPCjw5CfjLJpKOEGyTNl
         O+g0q6+oTSwbe0h1LiTIdy55hBhnWM6LovG6YUOH2ZX6UMjiwTdbRWl+6/NpLzDhMNdL
         Uvp7fvePIJjZhz62RM+8bqDkW4u7lfIYI3FvbxTfCjMSYoRN87xL+YGpaD3hGSGV35N+
         MYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269708; x=1791874508;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/klLpSgzFnLd9VTNITlyPIZJqJOaOloP8mGS3oXlikQ=;
        b=OsXuU70i/G5tgSlfz97rPELMiJMXhsjE/4f9Y5QkBYLijybSpp6EjJ/C4jp4hTpBoI
         F9RiYHuwgnqnu/ONEnzELvsJHQIFzQWMjX83JJYWWcLo9QQOe0ftXsnR/WG1C+SsIvSu
         jinnNznuCJoBinRJsaBACXhryaPlJn3UtShDTg6KZtnV3Ib2D809r9l3uuNR6jgBPG62
         vCKkN3fF56ur9CAeg/D9QmTf2tIOn14UzxpuMAGRHcwgngmxoICBieDnEQSHpCXKqJ9F
         8Gqe61t5Nbdoj6PgRB+Q0CAveUlGoennTLNDvaklzarhaWBsvKXeEUFWVxix+v5IXn+9
         WSqA==
X-Gm-Message-State: AFq9FYKA5ZoSt0lK9lQUnkBKANeOD9z/0d+GW08Bqmpn+0T8Crt/DnmP
	K/0FDkz5pyhondKbQ978wQr8XQvCl+LbkuVgVssG83ms4FcMTzLV0sPsLVhZk1CO/ij8CSQJ5o/
	a0V4l8XgcDKiaArmEu0K44hck+CoJyGuEzUGEfdX0C2rLK2qu8uBmIKqeH+tIUCiRhHyF
X-Gm-Gg: AYBFou0yc7wXiec/2mBojC49LNrrLCOhwcropm/s3Ku/TXbJtdL2LGJaD7Q9bvLjn5Q
	gnDuqE0YKCLumm3U4/wilqmQ1wOnQnpvaQqVINjOzbsH+bfBMxGe6xvLEqV8cwyWJ2ngE/a/JIi
	vD6WGWSPYceC5rA5NxCHGare90gzG5HedthnamfHGZwxDlgEjHFv5kOTqS+5ZZv7bqTXamnxDVC
	L6ifKVZ50F8dbr4Z08ZphVjXHnPbX1DfEEqxbnTFIpec96UqJ83Zme+U3X3oD7rB7tbnx5fAT1G
	0cp69JMYS0uZX9wnSGLd27Pr/6aHuqD3ugEV3+2fOlCFypJPXvEKFpf1cbpTFnDPnSAPZY5rDi5
	UUJzZWSlaUD0/WA9X5A60ZigXbJ5YjXtDZlIDSa7B7Om9x3XdgzSkBLr3EcPXTfhw/Ay8z+wQme
	bclT3LLQUFKVTZ
X-Received: by 2002:a05:6102:510b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7c8765bc290mr110187137.1.1791269708434;
        Mon, 05 Oct 2026 23:55:08 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7c8765bc290mr110168137.1.1791269707990;
        Mon, 05 Oct 2026 23:55:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm: default separate_gpu_kms to auto selection
Date: Tue,  6 Oct 2026 09:55:03 +0300
Message-ID: <179126968612.1110179.1912784063733436296.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928-separate_gpu_kms-v4-1-3f33175de133@oss.qualcomm.com>
References: <20260928-separate_gpu_kms-v4-1-3f33175de133@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX+gLpTBPhtTOZ
 is3NgxXxKr5XAnByUn2avKxWtVs78NnfpmEdbIyz5epF/KOukSe4RJkNqFhOOf8m/Plw+jt/dKX
 diMFUCEiGiHuUqifdy9MnwDZqVh0HJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX04ykWBaOpbrt
 62dNq+OPIgEUUKm5fCwrxTuljaefBv0plClbVL/MsySbLrPdkAeClf9ZiqbPOH7Kxd6RNidDUNn
 kzsHWF1L1jjI9Ef8+iVFDWX4KJThjXnyCfCwZ3VUN9lAxIg1+zURFiB3vvHJuA6NglwNt3gtpw9
 XhD+AeNKgY5ELPGUVt3OpkdNp0XlaoPB1767ulA4CTbjTXikyA0gWF/LH3/suAw5uPsyVIKvpUY
 1mrdh0tKTo7aNfK4KHbtd9hWgQhqYVf8BYdpQ20V8YLG7jfSq4lTRbAEO1bB/PfeLSbyD4QmfFJ
 +1lbd3RYWAD8lxKj06hz55OW+fZT1WqF48P4c8wzTA8GZa/q9od1AmQ/Ho57NkLt5LTp1jN3q26
 bntPjLb9+pNs6onK8P8OJZc4aSsMOCtbj3f4LwbI/jiYItzn6/lEMGR+H0WTPXzB9kOuMFfqSVF
 vjtWK43GiF0k+Qs1SHw==
X-Proofpoint-GUID: BHzorzwRXu_yvRRhIYhhR1mIVIZl_QbK
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac49b4d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=wOLXV0KxhkujVNyKNgIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: BHzorzwRXu_yvRRhIYhhR1mIVIZl_QbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Mon, 28 Sep 2026 12:28:45 +0530, Mahadevan P wrote:
> On platforms with multiple display subsystems, such as SA8775P, the GPU
> binds to the first display subsystem that probes. This implicit binding
> prevents subsequent display subsystems from probing successfully,
> breaking multi-display support.
> 
> Use the tristate separate_gpu_kms module parameter with the default
> value set to auto (-1). In auto mode, the driver selects the binding
> behavior based on the number of GPUs and display subsystems. This allows
> display subsystems to probe independently when required, while
> preserving the existing single-card behavior on simpler systems.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm: default separate_gpu_kms to auto selection
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cf27afc3bd6e

Best regards,
-- 
With best wishes
Dmitry


