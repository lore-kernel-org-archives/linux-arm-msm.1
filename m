Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED836F411
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721785; cv=none; b=W1Lh5ONyqOuD8zcBTkhSFfKxYyHcq2CRXvSxK0MqLJnJRNm82LUenq5NVwNImLCmOcMPkyZBleTOJzgv6i8aEZicv+ZsXw7yxcffUpXA0lLgPie2lwtX6U9ELnc6S5kMzyI0BCcw/7e5XG/7y8Kb/+cwzTRGOVzq30Ldw07WIRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721785; c=relaxed/simple;
	bh=kk2HsUfd1e5V5f/Uvg6ZYX2WSO5A6DZL/J4NAfHzS2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhhZdxsrU/qvtj4du2CcFoAPUDaEZdN70uAcrvGdLm/nA5VtyXVC9DU7PR2UfsP8MlpkYVixUmQlOKsIdG4vBM9RFGzrBF4wboaQmGGdDg19M/W+5qi441BrQQQ/RMwVAOmfSAvBPvoNMilKWVC466GGxse3omfKXvGKLpqcki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaitBNF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZskq6pJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaitBNF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZskq6pJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HFPl713682
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3PgkaJ6u5wDVRgfazpRB+APc
	TSKi8ppfUqNI8fCpwOg=; b=NaitBNF+25lqXbDEN8LTuygaS3c3dZCEoB1Em6Yw
	ybdeirmSl8kCHdpND8+Evrh2LmOJVlrRWLWzY9IzD6A11+Bc4zZpiWylp+w3KwaF
	DFCstnYoX4+E1IFwVrmYG8iPDXChC+l6ibmD9YJNfG+dlXThxc7CJ5f+NJf1rUQI
	rObIRVoeo/+wRo53hK11ZIuZc1PH99ZVwxeNdE0fdBodFdG4Wgc3NpDINI5P544/
	CQ9z3bVKl5Txb/ayFvvs9a9RAwOIAxPxhDeIK6EMZxOokugBeniFQkZyxAg3jbgc
	HMPcvrRBhPUKMCMH8+8n025Iq9GH0vupBBF7PKWSC+Go3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bnjbcv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:23:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dd69b00cfso6776191cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721782; x=1788326582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PgkaJ6u5wDVRgfazpRB+APcTSKi8ppfUqNI8fCpwOg=;
        b=RZskq6pJV5del69cERP81O5tZFTkZOgpuFEleVAAoLjY2Pb9wMi49rNZGJtJ8SlGAe
         DtgC+03qOrk3F9uDncJ5DJlKAJeqWyukCXDelpppk5shq5Y/4arhunryIhxDFDBwsgg0
         7mAdSe/5E8HuZdMuqW9VFIiee5moxWu947mR8WA7wOPpQKArx0gl/CGmx0eJNYtQPSMP
         vRB5P7dUib9Gvr0ugpLkLQEyGT7ayYX6+lhWbRa9ERMp4t/B1u38E/iRDW75ogPd5dcR
         5ElsTmaAP3pUkkJOpwp0JGo8tu8YpboJEJzl2asIhhkXyqXtwsLY+qxVHNUKIQbaqC0L
         QlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721782; x=1788326582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PgkaJ6u5wDVRgfazpRB+APcTSKi8ppfUqNI8fCpwOg=;
        b=bkLlbQL1rivLGyDlDTWzHvvUQ90DoGEsHz7a46evXxy30gUCHg1w774Z2y61YgM+XU
         iSCwKMyIOGT6QxbSy04JbNrmRYSMSJldK414U+ltjWCEn0yX6gEqn5e9r6CvbU9Dncu5
         H8ek/Pf3l7vqq9njV0tW4IqaQw/4CmQt/fJqpYc7RnQbKMTDoudXDgzebV7FP4CzSSVO
         GRM7b2IgttlW3vnAQYCD0EeaHDvT7SEWYhMDBKYVwXdO4Dj4rVzutcmZ+BYdXYs0JC0z
         B4mZRUaCqaSoUn8ikI7n7GpH2C8/YS3xUFESKk5l1mkluDJEr2oMKcvuka7d65Ng3KFl
         xnHw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9UhFwTyP38Ia177xJd/zW5Ji4Q8GCOIQjY1NBs9w37Qcwj0cz81xADd8cesAhJ4enYGdjXbjD3CY1gOj0@vger.kernel.org
X-Gm-Message-State: AFuF++nd1kmDeoE0zcLAmi6Xa9Ri1uYn/FPJbYrUmmJ52njeKmWzphTc
	ysLj4KRkc71PnQve0p4n41YZBIBZ6Ll3RH8p7WEe/Z0Mtlm9KqH2j+oZzSqUuCr84J+hvkj46CL
	jo5W1OvA/sI2YLcLeMGGjAcB0sXDEueWeSyCa4O5E7f9GzWU5mRAcOwm2rJ+5+lQoI2qO
X-Gm-Gg: AR+sD112x1RVENEe180zSPd83yxFA9Rac2CwWNCxY2rGDzMtLRMuWRIQDSzoVJNnv/8
	MxmCwLJlxHoGY6DWHBkr3bgeXpb1s8Bfrr7du/LoZOGRf0WoQ4S1HRGBoilW0vyw45a+wA9ksJg
	j9faSAryTTLdamWWWvpFdV/fXTol4SJwLSfZa2erXp1m28v0Bg4UGfSYTrCpj7fgHsO0sltz5Wd
	+8hj0sPquZwDbIa/VUrDHlu17HVuxBpAPRzek223lp67ckI6ndsoQ11Jb+07DTjc9ytlA8tFbXd
	rRMmfRw54RfxcszHD032LJqF9RqDNAhbgXNJHvcsxD06OZ4uLTyt0YRxMKmx4AiGbj8x7g7rq6X
	Ml2hIMQDi3Wrmtw==
X-Received: by 2002:a05:622a:230b:b0:51c:10aa:9cd with SMTP id d75a77b69052e-52e423bab97mr43141411cf.38.1787721781624;
        Tue, 25 Aug 2026 22:23:01 -0700 (PDT)
X-Received: by 2002:a05:622a:230b:b0:51c:10aa:9cd with SMTP id d75a77b69052e-52e423bab97mr43141101cf.38.1787721781088;
        Tue, 25 Aug 2026 22:23:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c251b7a9936sm142312266b.49.2026.08.25.22.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:23:00 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:22:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/6] arm64: dts: qcom: Add device tree for Nord
 GearVM variant
Message-ID: <bhn7vy5guuvazxeyzxkv3nhop3xbwaapcqbb74t42k25grgqox@auv7tcvyw323>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
 <20260826041200.528588-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826041200.528588-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: q5BzHmjPGQay9pYQ8uHE-5iUhIrGfFFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfX+D3JkNFqHeGg
 c/Eie2SxlndHZ0V/GKTEeWmZMRDZVZmHPkpui1g4ylf9+AVhl7xv5nzzcxcfP4F/sj5vh4azjGw
 93EI5NfJpio3pVypQcP40pIznTf24FErd2nvPXf4X29hoYAeseCfy1yWiLumtytYQoTcjom8o7A
 LXGA74GVkBKJ/bWJKvvTLFzh+VQq8wlR7j1vxJE2y8gxeSzkDWNJ3YpjBgkt+6ZslGfArHefUJ8
 QYgiasWA4B5TQMn4LM5UgBbK4+8f+5zqLGTy/lGCPGuh0rTCARKBP4v5zcyDFCan7SSFA7y86Ht
 TrNESoyqvYpQXe1jItY+0CkzVPmJ3BM0duTSdIDBUKuwppCYFps8pQWx7VzsSaUV1DC/Emek8Go
 sDQDoYS386vYlgnPzjKZhdUp1xnKb6YKGan1yLzJa/D3CFTQBlEmT10lI+qWXJ1nhwsY1aa4Fz7
 v4seHs7FZr3xyJebMFA==
X-Authority-Analysis: v=2.4 cv=ZuHd7d7G c=1 sm=1 tr=0 ts=6a8e7836 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0PVgGkzcavuvwKAl-bAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfX2Xj9WBIkvkza
 dCaGcH15Ca7qKcmKuDh+k48Fviwwed9WuCRHUN7jzbZT8zhRxbYeLwFMg8Jc8KFOxARhl52hRoF
 YefBfkkeO/HE6kDo6tx9bJ9ltn0GPBU=
X-Proofpoint-ORIG-GUID: q5BzHmjPGQay9pYQ8uHE-5iUhIrGfFFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260043

On 26-08-26 12:11:56, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add SoC-level device tree include for Nord GearVM variant, where a VM
> controls platform resources (clocks, regulators, powerdomains, etc.)
> as SCMI server. It currently covers:
> 
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
>    controllers using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
