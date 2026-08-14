Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328838D419
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735651; cv=none; b=koU7et7d2HGvPb0zxlsjWn+JSAqXrM0IJekGQPZr6xsPo2jJY1SEzRkKlNismJ92fnteEcWPyrx0uGVb3lLxTVcN16cl0qNBWNLFlfPnrN8FWMtVtNs2toniMYj8ooQbwEJMohI0q2mMnGKQYuEuYunxjnUe2NNNc8lk/SAGEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735651; c=relaxed/simple;
	bh=td8TMQ+uGBHEq+eiTdxwzSZapAF+GF3fAt7nWVajc3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwm4LajJRaR/CxRC1aP5EQi3CKslvic5YEEWquaREaTaBPkfiO2wsBDWFSXfpQ46M9nTnADGkWEWQ0kEkyhllKaBYCn9uG2EJOv7KvqTI6MiN6ZhMDAR/qSuDMXnPOAQ/gsqzFatb+84y8AkfQCtDrPZ+L6dVAvwOtIEsSDPtPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSFHEpFP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R57qW1DC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSFHEpFP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R57qW1DC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EIxRsP3096403
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSLfEOxYP0vSrAkxyki0StAKequhT+48qAGHOJcTMn4=; b=ZSFHEpFP2tHrnA2a
	g8Z6pgMkdP1GBnj0dh/O6Mt5FP1DNj2IQM+Zmek5Ke5ifR1tMNy6O+lOAMufRaqo
	MYRSZjCgoKb+gwSMwPdX1XywEaz/WWgR6xGQES3p9mRqw8G24T4GdYwDfBO26LCa
	/GYAH1Xe/ILMoQDkL4Qynyx5nX5ya/3+Wp8ftPcrFn1XS/NjhfARVJ2tz2luqFY3
	p9tF/zhmjhh2bsKSpBa7zdK5JpYpk3fIeG3sdNBNNnRZ0IIW8k1obeSr6HYJxNSG
	sbtMcy6zLVhbC/1FreZFdSgx/KLfBbHBaI6EUdvsXO/Hx5dobp1U9+9vOJX0lETR
	yzVafg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g28sk03hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:27:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-392cf18db8eso2346974a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786735649; x=1787340449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSLfEOxYP0vSrAkxyki0StAKequhT+48qAGHOJcTMn4=;
        b=R57qW1DC/BEA4EVdFI7sGh5rXgnweTkkBDcXBKlE9cD+Ahx6asOnToSnxo5Bp/HYXg
         Ce/fqNzJneQ0awF5E4Sd26cpq4Y16M8ahU4QwDaDSUwSSqhrZt15wuBfOX4XztvjzEsp
         MsUsr1soHHa9a//BWPjELwDK9L3MgSrkki48448d9SsZFhTBpO3zQgXJ0D8nh0NqoGTo
         Q3bs8YA5gpKyKlXAIaKX6vRYuf4ABz9KvwoQwjvklPWGXJ5wI3at3/4KeZHFScByiux3
         uHp4POUnAJufEUlDa5y3GhWiQF28rUlOIWPPu9QD4dWn7GJoXy9im8JUTH/ElaSybaJQ
         Q5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735649; x=1787340449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSLfEOxYP0vSrAkxyki0StAKequhT+48qAGHOJcTMn4=;
        b=eUDaZUVIN9rTDCiSeLwt+oPE+WNAIaP1IUpSG/VaCvJ3vnyvc9IBy4BMs1EBqO6dRD
         hZm8zAy3hXXOeXu6AKhvhoGOjlyCE5nZ0XCVfHDEhegjx9u2RLvMBsAux0LzaYbS0voM
         sN3QsLuLvTxw3nTBq8oT3wTsbK70vdYvnSf5MjALIufZdtQlISVbrabGsSiXofpj9EZn
         JWIEnt6HT99/XeqMKzKDSHKRi3PUousU1TZb+QJjrolyVepRg9eoJ53X3ac9I36+ZIXK
         q2bFi4+qloHQA75lsRe8oBgYlGkXAN73iiqlF1G4YsIrAYw8er36Xi9sKQFyCS/KPFdk
         omEg==
X-Forwarded-Encrypted: i=1; AHgh+RoAYUBKmPDV3YMFCMTs1AvE+RvKEaFKu/ye8JiZuhNu6GCUfN43AdDDusyqqC1pWvBzW0uJyxPPyZQG1gSS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4eTuHUfCz7Do95r9qoji+7f7/PO9YEsspz/zo7yJYrsWIMFHC
	RdFkw00gaSxexRHwU2B5otZKZh30WkOuXbdqnuFzA6dKFwDWrWNfXmXsVrNIbdY8HppFBBJguFX
	bV8jcO6poy6QB4V4DgMtujbp/DCWNwbBxZs5a28jWddswqLSlDmXKNRXw2jCVzQNhpZcg
X-Gm-Gg: AR+sD13JR4joNFJ8LyAer0swX2cB+3VPADC+sMlCgbNbtQJs3urWgJoiwdOiTkAIp6b
	x/LX3jintT8GVx+0ufCx2OrBumdt/k2CuRM091f7GJ0b6goOEeFoSEB4Uw4wUICUJZcL+mgccJ3
	So1OgnUdN/nJ6cSdSBn8FipMQFSAC5G9yvdI4pls0WIn7X5nf77GSy242BwtZFQ25f8i+UTvUaG
	70k81V7sv7KCopEndv/qGOboLpCN/EsZCXA6KvLcV4ZP0hdL8TX4Q3uGoJjrLaCUs7CCdeXbDff
	Mn+gEHTGINcjk6HrvYGX9rtNoj0jjkMEl1ZpR8sejXumxmQAPAzveZTXrOOp317kziahA78EK1a
	XslTV96DKCefNOsbqOecxjkIwMhMJKQ3JrMNiyzgNQYP01yPsVWBgWw==
X-Received: by 2002:a17:90b:4fc1:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3933b8f143fmr10004722a91.12.1786735649162;
        Fri, 14 Aug 2026 12:27:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc1:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3933b8f143fmr10004665a91.12.1786735648703;
        Fri, 14 Aug 2026 12:27:28 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387e49d3sm12130628c88.7.2026.08.14.12.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 12:27:28 -0700 (PDT)
Message-ID: <228c220f-9cc1-4ef6-ae4e-afa9a6c22b6c@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:27:26 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] accel/qaic: Add missing <linux/device-id/mhi.h> to .c
 files
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LKxWhpW9 c=1 sm=1 tr=0 ts=6a7f6c21 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LFKF1gb2yPlRpIi15JYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3K67wne31hi8rJ0BL-WWqh7Xl96kOiRN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE0OSBTYWx0ZWRfX5jf5OLpGl0J4
 eQPwKQ232UMaqB184Uk5rN7EPtHCJQlXYZzeFfSeFJ++gSoXO0t3NQylIDhbCTFfxA9CwwGD5wy
 2Xx+5GVxnQuwdz2KXsCom1dUdtBEGaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE0OSBTYWx0ZWRfX/sLiUkWuxQVj
 SvU+ibZS0eeUrPwgh/h0Wm6LCU13hKjGwT142N2QJG0G06rdhWs2YSemgcVACjR39M8/TFUiHAt
 pueZKU52VeY4fjIC/uRb2/dQd8lrSBOUhaoHs/8Zzd7p8XJWJzYawMQ2alHH/CHSsafrrpH4H7b
 MeRmLz5rS9HhpTD00BlQOTGHvsSeAYUMkVoVK47X0j2j8vyx+SDvRTMQs8wdl3UOZtN06wjMDCV
 fl3+3RfIvaVJ1QCFGzXMMMrz40EyQ3Wav10TGD8yWQ+TzJUsBhlTqeEMtgbK1ji4FHkYe1WD7XI
 29eLxIr+4/Ee9KXm/PUr9Okatjao0pW1OICEIrPVBnNNPzr9lQmEVpbrdoFv78Z/WL9wU/Q2Ojt
 Rg/N+1mqH9+6e8ReiIqp3lUM/GV9eIUM1kQdpERBh04CaneRh8HdJx4q8inHt9Je/NwIDpKx5s8
 UM9QugR0uVCquKbs+bw==
X-Proofpoint-ORIG-GUID: 3K67wne31hi8rJ0BL-WWqh7Xl96kOiRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140149

On 7/27/2026 11:33 AM, Youssef Samir wrote:
> Although the qaic driver is using MHI, it is missing the inclusion of
> <linux/mod_devicetable.h>, or the more recent <linux/device-id/mhi.h>,
> in some of its .c files.
> 
> This series adds the missing includes to the relevant .c files.
> 
> Youssef Samir (5):
>    accel/qaic: Add missing <linux/device-id/mhi.h> to sahara and timesync
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_drv.c
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_debugfs.c
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_ras.c
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_ssr.c
> 
>   drivers/accel/qaic/qaic_debugfs.c  | 1 +
>   drivers/accel/qaic/qaic_drv.c      | 1 +
>   drivers/accel/qaic/qaic_ras.c      | 1 +
>   drivers/accel/qaic/qaic_ssr.c      | 1 +
>   drivers/accel/qaic/qaic_timesync.c | 1 +
>   drivers/accel/qaic/sahara.c        | 1 +
>   6 files changed, 6 insertions(+)
> 

Applied to drm-misc-next

-Jeff
