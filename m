Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A13DC4DD
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007027; cv=none; b=jUVF1Lhcz+zcR+5lr0JgzqJcOwyQJJMtoVFcNspdBE2gwHxBSe/3SvsF+prh029l9S4EDNH5TLpHde0orCgek/FH9ZHRipQ58CtFJEG/HDO/O8l+T2qIk7FfmCchjZijOe+x4MC7YCbntzW03CbRap9M9kq8GSJqTeKEIGqtMzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007027; c=relaxed/simple;
	bh=EWDTwXvRttdGqjm53SP6oTvMdDNGhbgW8cLYWUaOS7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0W2pqKLd+AwMn9oNJZnx8Q2mis3Rrj2Cl6pfgZe31s0ADRUacfq9MwZ2TL9b5+nxjWvt/3gY8m+9uSoA+HbtYBB7j1sBjoFSU+fJnC6rx4C+XM7oyShxVecFFn9UWa6FKLI50+CwDD58NQtDcwjeRAmmC36udQKdO4EYbPIveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fG6RCGs4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ipUBaFhR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fG6RCGs4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipUBaFhR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767GIOx4063193
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Ocsajyb+BH3bNhjiOtbMDRW
	gAopJzyGGM3KXBbWDT4=; b=fG6RCGs4XStcoElGtiaM0FrFJ6GduWb1SKc8ksQd
	gUEDYyKfvK5WxXhEjAg71x8iPZu1wHlqnNlrEp2MYH/7liMkny/0zchkpW99MDKj
	RT7dlLhVeGYEWCHAx6HZaNe11W01MHyez2IlqwgBycCkdJjeRp7nzYzPdTYb9ur7
	OAYjve/8dX7qmcAJdmfdMIA/tkRK7cq3wGxL/pICm6RA//rVwQ+gUJFTm45JhbFx
	cfBCjpLMXQhKGjdESgQalVp7oWHgxHVFRcfKH4GgPZJhW82UrKTp9qAeUrQIorQd
	6qVZ51+epb2vGvZKqfvmucWjq9JOBuLduEeRffjLgcV6OQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5mk09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:03:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce64c41efso32423761cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786007023; x=1786611823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ocsajyb+BH3bNhjiOtbMDRWgAopJzyGGM3KXBbWDT4=;
        b=ipUBaFhRcXvwmoTdwPMnvANiXH04UB92HcJYVLajwgxel1eB4nNT/bjMAmqudwWG0B
         dx8QEzLkMMME9PiB3p6MuqK197RdJrvQPI/5LVY/HVGrTN8WCxk8TBb1EKqGAC3ROrlX
         24dL7p95ovHglaXy5lvMHiVeY/XEdldAVd7dp49Lkt4oZA+ydlEFOHz4vx8ZcbfIwUcU
         abSdTBnY8MqsQ5oa2tcpdFexsDSR+qAT6fRoObrDTd3ezLwdwBMqQXfmGTYcSwrluRW8
         HqxVH16Ke7lDxWyx7oQMdBV6TgQj2eZDzFJpx/OQJmRRzBFdCYRvugGyensf8wICm1X7
         yO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007023; x=1786611823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ocsajyb+BH3bNhjiOtbMDRWgAopJzyGGM3KXBbWDT4=;
        b=ZyjdT5/Hlb/Ekycg9gmQNUm/9kYNtivr8ENi+rjJYPG0/U5E4MSgK3jMkwnhcnjzXH
         myNdAQC4yfdIHi1TLy20DyKb42YoCf0mkX3S6CLFRtlIxwB1gdxcrcggSTbdkIGkPxno
         /h5buLge9LfTt7OyFAzUmHwlX6NbTFAHKyzqPNvKQZ47uKHDJoMHNko/Ehs45R/AHIX5
         NC9smgBku0gqHzEXsBywJ3RbDMRsrQqePsgYVnAb7F1mUnbt5lWYDfrzluI637PUb4Lm
         Oq5vkvYtyA5/sK3MSEILRUnf4mKk3DlLgi6yDESF31O++jGlAT5Cu5tnpYZ0c+pPLgGj
         HV8g==
X-Forwarded-Encrypted: i=1; AHgh+Rqz7wxYrU/TQ+jX8/xEHPREdc8zxq4hqOwxqGYR+bH7azGprVDyGxS5MQ7XZJ8agSx5caefvOJ4FbsQ+1dN@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8tlGg/uyRBy9nT6y1+WLWuVubL+noPP0mmTLhj2zYYHiddCY
	/hOC9LUcJ4oupev5o/jhOZBVZgApqiUEGo/UmnTuvxJctC7lbkth1LJKDe9FjoRquKQrJlApPsI
	vaeWI/sL6SY0ZO3N9iCvT9OT9NQvv90pEuYgg6TGclmxvIwHesw5KT/SsAU+KD/4sF5sc
X-Gm-Gg: AR+sD10URXBgkXLJfyqZ5GmfatzDfhxeZ+fSwNM5NIHZRGTSKsGnxPN2TBbIfHJHLTp
	YwrWzA3xfhS40tFOpgay4BkwGmVYfrS+dOOC/kiMMjNDijEKTdoloIRE6HP5+Zecq/rRjLAtKtN
	1v61Bb5ChRI00hHTn9DRDNlabBG/SIjrcw8TyanCgNE+6ChEeAXAW9DkHH1gRzANcVwS99vczDu
	lFEbnfyebMLxmzF2VP8dPu89iLaof3anIHFrPn5MNlXhfyeetJG1l3MVuSjtgY+0dCnPEWxaXC9
	/eM+uo8CJzS7+T3MV2BmmkK9CBFzLkdIR5qjV8RE396GxMwPOcz3CVGpu197mq1Uc7Q+kKsIdCR
	dytlu7sewfsq7jjl9TzoIUkRAp59TUB/DBtS1WDhk+61UbNe6Athxe4G8Gt2+jt+X8Ff2QlzAsX
	eGuDwXXrRdYKOH+w==
X-Received: by 2002:ac8:5d16:0:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52ce6180b12mr106596431cf.28.1786007023237;
        Thu, 06 Aug 2026 02:03:43 -0700 (PDT)
X-Received: by 2002:ac8:5d16:0:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52ce6180b12mr106596141cf.28.1786007022812;
        Thu, 06 Aug 2026 02:03:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62af826sm614988e87.41.2026.08.06.02.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:03:41 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 05/12] media: iris: Route buffers to the matching
 context bank device
Message-ID: <y7idhuok7ndyo43imqg6vo46ybrjkbqjwifufxxjmijsayb56m@6q2u6sxhsiyw>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-5-da52b5228dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-5-da52b5228dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MCBTYWx0ZWRfX3VNjXfXnVe2J
 t2PM0f9lMK+YEBCDLb7CMqB0khkt38uNZ0xFoA8QBws81u15aAEFlA/3XA1/9gn7rsFRpfJw/Se
 MYXzUWoJg6gnlX8+ipvqpP+Mm4EDnmc+ZWzfCHUNVdiUJu55W03xMPJwJEsA3FXYZ/a+sr4IVIE
 7B7ShrNIKuyyfHdLeCpI4CocCOPHpJeulZSQ1UpU2HRjMJ1Ufr17A2uqmFCGRnXuWrAsmdvQsmb
 Bf6DIdZuu5dkNtNsSjIFzuOZ6u+9IqAif0fD+e1caQR7FKsnR1NDhTA6WksGCk4TzPfrW3z8Qe2
 vDkY5t1+kztSoE0w9JPf1pW51DR4hI58bPx1QLRRaYJt9D7yhmmXQ+0qsvFYEVHVj0pXGs0Jr6M
 JgutoKowsDg6+/t4ZFbkycxhtWt8gFaTPeQbG4WC+1WJFW+BZ+WttEAMjHU4h8JCBP/PrRfM9bt
 cuPa7f393dw4ZqNMBPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MCBTYWx0ZWRfX3QEI7syPIvkI
 3thBxX05lIMGHLHWBSjYM7Jswwn41cXdmqmnxGXP4cWXOUOdjT/JZCaNztu0MAlhCrIhqK+k5wm
 BDkhYITXrtxqjs8FrposuQMn/luULBY=
X-Proofpoint-GUID: FHLuLHVhyZNGp6jZ9fhF2toIsfTZsjgD
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a744df0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=_nATiDK3T8zfJof2TlYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: FHLuLHVhyZNGp6jZ9fhF2toIsfTZsjgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060070

On Fri, Jul 31, 2026 at 11:52:20PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> address the full range. With a context bank device per stream, every
> allocation has to be made against the device whose IOMMU domain can
> address it: allocating a non-pixel buffer against the pixel device, or
> against the parent, places it in a domain that carries no restriction and
> the VPU faults when it later accesses that address.
> 
> Add iris_get_cb_dev(), which maps a buffer type to the owning context
> bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
> NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
> buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
> BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
> inst->domain: for a decoder the input is non-pixel and the output pixel,
> and the other way round for an encoder.
> 
> Use it for internal buffer alloc and free, for the vb2 queue devices, and
> for the HFI queue and SFR allocations, which are non-pixel.
> 
> Fall back to core->dev whenever the relevant context bank device is
> absent, so platforms still describing "iommus" on the parent iris node
> behave exactly as before and can be converted one at a time.
> 
> Backports are intended since the first DTS of 8550 binding schema.
> 
> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")

Drop both lines.

> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Tested-by: Daniel J Blueman <daniel@quora.org>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c    |  8 ++---
>  drivers/media/platform/qcom/iris/iris_core.h      |  4 +++
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
>  drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
>  6 files changed, 61 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
