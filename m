Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D2F52D2D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917447; cv=none; b=rtcniMiD9X1kOaik7JX2e8sSCP7rNmkHY50/iFzMco+bLeYRb+yZifU7pKrNRuvF63A+I70tRZ8PAPWlatwy4OMH0oOdio822HUgnNdVY7awnbbgxVp9zATKPga3l00IDllqcv8UegC+dVeBByssvf0whMnW2kdnkTzi9ukCQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917447; c=relaxed/simple;
	bh=Q0/TLidkKvg2xSHv4KIjqCF+0TZsFYgqWe1JrE9WSN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYlW0e4HWslNxauXAJP0ET2DBr0dFtp79hXCi/9e33vKggepv6ms2felV9gkdU8TlWZ0BYQMUk3ST/QNTjVR+oRPUS/fhuFg5kaKV4siQl39YlzXTT8A4kZSGQNhP2ZLhhCuv+7bNQYKmX4tWlGodlH08BRoJ7d3fN2x60siQ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5OK1XFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YncGSgBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5OK1XFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YncGSgBh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE44h4009426
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CU7IDZhSwsFbiiRw6REpkR9M9TsmBZVPn1ZvgDZyk8k=; b=J5OK1XFlmtVmGlYw
	bXhJFQIYOyGR2zofcF9riYiqLzsJ09HW8KiVhETCaKTa0jjMtdnoiSAr67A0SHXU
	+5VZmFV6EP7XnlP31tCLwRGqOS51wdSSaFkzL6g88y9noDVC8YWi97+VSfuULMGz
	3aaNyRmGc2L8vc/fs4gPVqgjUZPeyl91N1hDIhSueOtJBPRfHvnD6OK2zPbympIn
	6Fs4XRXj1luUoL6MH4jaQnCpIawwfixPWQzOPruGvnvwl26TjLDKKUQoFsvX8I88
	SAgDIxxrYmpsy7SGI0ZH1rbzqdIvXa0ivyKxhVkIFvearp/n7bLzulitaTv5icu/
	IsRbYA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjk9p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:50:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2883845c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791917445; x=1792522245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CU7IDZhSwsFbiiRw6REpkR9M9TsmBZVPn1ZvgDZyk8k=;
        b=YncGSgBh42sk3aylGn7hvDM9OX9/tBi3bRkvZOcyWUaAj/b7T/B/cZY4W+KA3GDP/z
         MIaszEx+gE+bFEiv3mhZ6x5SZ/6t8Pcxi6JBMl7IZbTjmCAA8k0/SpWobvYF/qxhiWVl
         XLoAfAIzjBVOpfXThTibLCl988hJJJjOxlNJ2dNdr0qJ8cg9ivQVt/KVdknylORgB9e6
         NOgzXWYDkE9HW3MkTpTlUuo205xl/svFoDBfCW7vJIY5HmDdJDhC13MHt10FhNkXI+Du
         YeBnQeb7989yq+VkbpjG2O/Lupv60XNPi0vCRth8++jFh91BD1+0n4sMnRYkzLNf8Vff
         TzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917445; x=1792522245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CU7IDZhSwsFbiiRw6REpkR9M9TsmBZVPn1ZvgDZyk8k=;
        b=emqM6m9gE4WxGN7PWkd3XjRv1F7+yR/o2OHhttW8Iym7c5NgrLGuexmEx+YRcZUgXs
         TpXtqd2AMPY2O7JRKLGJ9FXhlhArePBCdPy5RYc+xEyNOJgdGJHoFJQGNtJGGbcT4+bo
         sBvT35AlydHORdTnZIg5R9yNIHoWdTP4114/WYM6CpLW3hBQHmF83+uBBhA7ySJrwF8w
         NE44zL+vVJ80rS347MZ7f5Sk7ga2cKGYl5D1qv5EloF2UoZvDTvvaTxa1fQkB6V2mTXm
         5rHBVP1tQ0QDXtv+iCS8b9odAKplDl5lNOvwPSo841xduHdMAsD8AItA85NL6Ezp9Pqi
         n6JA==
X-Forwarded-Encrypted: i=1; AKwUvBz5n9mMWAZNEOuu8i7z7p9hog4VdDohnnopeMFG6nEjVd5QqhrMjv1e3JpPgksYe28OxVA/4k/fRcRWP7LZ@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Qa3+6Z02W/lKd1Z+M0r6UU+CF9W+4+Q9AAI+V6vRgyqoD08R
	Viix3Dwe8AyMYQZQnXMlfhLrvJvr5npJCiH36A0vJ+TYEWod/yPvrgg8qOxktL1+Rx6vqW8trfx
	9FVH5NJPfFpGIJzhNliCMOC8iOrJmYRv0y8bvmSYie2qd0FRIiSPsGX5ZCwFkf99svh7V
X-Gm-Gg: AYBFou2oxl3oWLqN3T2ZxSkkTYZjzYsarL4LBR2OZsTzpryn5Nv2kqU99+el3qCt2wG
	z7+kNNeix8W/EaAgH+xFTOvYaEC5OCO7HZ4P2Fu3/sHCpjc13bQLTL/jiQlWuGWHV7F0KGxjIUC
	Rr+rHyQgoKEGgteOQOPJbryyoSyT/7rS2IPMhPh8HGYM0kxITZ/6YHey3qeR2i8BpFAKgC+Osfi
	nrKTEVKPMGJTssEw9ypHvA+/7C0IqUKdwhNUqrbX9xCQlqFU/SAGUuJKXuIfUBcMQdpII7MfNaA
	R7RY2zX0Ddt1rU4+F+73prTKokHhnnoLzJUXv1mfTxAckkzhTYTnP2E1wOPw7yvfwR09MsEtZ60
	RcKJ0CsFZf0o6no30juGUG130OR1pk+akBQ9D2CnQNhf7/o1PlA==
X-Received: by 2002:a05:701b:205b:10b0:148:722b:7cbc with SMTP id a92af1059eb24-16a5dbfe430mr18480520c88.14.1791917444607;
        Tue, 13 Oct 2026 11:50:44 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:148:722b:7cbc with SMTP id a92af1059eb24-16a5dbfe430mr18480483c88.14.1791917443835;
        Tue, 13 Oct 2026 11:50:43 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1746482c978sm20027730c88.13.2026.10.13.11.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:50:41 -0700 (PDT)
Message-ID: <15ec8059-b73b-4c28-a326-ca9a8ef7cec6@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:50:39 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add support for AI200 virtual functions
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>,
        Troy Hanson <thanson@qti.qualcomm.com>
References: <20260831135008.1418190-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260831135008.1418190-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5_WS_cvuAOJ-Vfbvxw8hezwz2up2UQjv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NSBTYWx0ZWRfX1JqG9dbwuHkD
 XgXb4vbSNpsoizT+hiedd7KkO11gcCjGCeg1nBhwf9k6K6oMSodXmraJ+xrlQBhkzrD3/Lg/zda
 9clcWok63LesQTtJeyWq5HXWwpulZ92n6vuviSBL4Wbk4hakgF9KTo2eqfFOhIyhQq2ovXPQTUX
 OMqZWOyhk+RHI6QOOgOPhmIp+FEa8YeeGzGLORcesYKbNe5l4TR5SM4MJZxLfDTGwddx2v8KiLm
 8uHXa4I0q8QNiYEBN/2JE171XNzhCuCXucX4beSLa+QMgsashsQv+z8WsEQSyFmiGAP3yDC8ZRM
 QIVMijdY6Igpf9lYiHUuSn9vYfuAM4CGbAoBrJM8NvW+vQeoEH4co+6UL89JYK0qfs1s6mT3KCc
 wtmog4ti+vPIUD8CIOyVk4IVLZsRaL1TLxp8cHkdiJ7H23/5E0rJLK0NpnHnwi313JrrR9QMvZX
 JXmheQmTQkz7yIhd9EQ==
X-Proofpoint-ORIG-GUID: 5_WS_cvuAOJ-Vfbvxw8hezwz2up2UQjv
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace7d85 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PocSdXh09T82xRbmK9gA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NSBTYWx0ZWRfX42lNKxR4RTOS
 bRl4a5+ejGOWPnNWzgL44U4LRBT5uPYBp16MlIZuMzllJEHINcU3mhqxGne97jUKVOmIFcvN8Z/
 1JtHOHxQFKTDf6m+pAOUKrd9yN/QLSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130075

On 8/31/2026 7:50 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Register the qaic_pci_sriov_configure() callback to allow VFs to be
> created through AIC200's sysfs numvfs entry. Additionally, define
> a new MHI family for the 5 channels supported by AIC200 VFs: NNC,
> Telemetry, IPCR, Loopback and SSR.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260814165907.C76841F00A3A@smtp.kernel.org/
> Co-developed-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-next

-Jeff
