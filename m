Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608253F9A1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959666; cv=none; b=EwHOUsybaIyDXS3Q+CQacPaBkITgT8+NTxvLZAlwy+4na7+U/nO9gknXTdzprABR9/C/rulyL9BVGmpRvJdCkL6eq2wOkQU5GrY6mtYbXg8di/myqtyEeusq/v0Kkerc/o/rHoBQSNtk8hdNhKzEVcQqGGpSSaUdogwZagjdc+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959666; c=relaxed/simple;
	bh=nWInz+T6epfCYbWyxNpOFpxgjZiH+HNLFhl7tc8Vlto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgkhvzsIdhOnl1c6gqV2jByreghlgEOdi5Gbm+Uq8DduHRLgYeaFtx//rsHYNkU50x/o7GtP++oEV9DqHj5zsQJHEHhqdtSv19UkKwBTnwH64uJTylutudbGNGLvt6xvGuS/jj1ZQ/2G2jEkQ/2njn/6bURha4xOMh0APOZ5P5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6lYs7mo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jv/xIViG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6lYs7mo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jv/xIViG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1KTQU3018226
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwlQq/zXuZY21MZy5QVnIWWS1D5S28zS7MiJkciQeKE=; b=b6lYs7mozFsFvkyO
	XXdXvROj2DeUa1/i/UvNlwOItWD8/p7xgyTI7pALRNyH8/ZGRGVTY+hUbl6dXQ9P
	y7cCR9PlQl8sXMvDMpKzNdzTGGsd+AWU6FeR6rSa4z8G9TUhCA6c9DF0jT3hCctY
	s0xI8p6/MRLZSP5tWAJ91Xj2MkvQNNBnrTd6On8mi4ABCWG10SqQuhVnBykTxfcw
	NTi1ZGW1+iWV7PybD+W0a3vd6hQFKvSrpegIIpeNztmal3nX7jZvnMtwnmDxkzz6
	xkIPXp5/EU6N8DWH9Kvi2IZW2xb3ZEOBYX47AzS9TkHPK8ISfz9dictnBWV3w4SU
	8ex+8w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b2tg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:34:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8862ed0539dso160046b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 23:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791959659; x=1792564459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwlQq/zXuZY21MZy5QVnIWWS1D5S28zS7MiJkciQeKE=;
        b=jv/xIViGqrMlxZY05JsZbAzWLGAniS4UbJKU139Qxg+i44LndQBToJJsLsw8jlDzF5
         VGmghobfT0xuExGBhIWV+Pj41xHF8y2+ML5Hu8dvc3SpPT/XfkeegfK77/lEVnzyqcDT
         SmrRuqsBWrihMLdK2yWHftXdJL9hK90hbwl+G6V5Ckf87fnW3l585kQ5/Vweo+rwiPrx
         5AIH2vDq2bKrWD/3wOjg8A73nx3qHslt3+/sUEOCHIDljncVe5ZYMifL3CIVna/47R67
         LLokVA1yjmWcGnytZwFnCCEf/9JqFpYi2aqUvAtEvH4Ttkh1yXeEpry8fPs3LeibSEN5
         EhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959659; x=1792564459;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwlQq/zXuZY21MZy5QVnIWWS1D5S28zS7MiJkciQeKE=;
        b=Bi5B29j9doXL0HxiemHpI1FlCMstg9aAcOWwchkBcotGeQtU2xU+pwj7vs9jk4nkRR
         Jd4hf6I7veMtr659TiRnyK76G4JxuqQaM+ReqiqZKxbaqdYDsqP6sSejFpZwCdMdkEvI
         73DQ4AeNG9WBsm1SMZOean1QuIEKs7uVmrGcXcCsfTi9qqDDdodXfZJjTthj4OZPe6Dl
         OdUWklxTkEQGKRDEuazeabk/rR26TFPaG+AjOBC+h/wrmhSJSKZWBEH6F4G5MUZ1e8P2
         n3Pu90NGZAi0GrmT9jdPYThQaJN4JPLkp6bwDtNKz/CjvfYJPqreg7lK//xaR1R6ggcW
         Z7Rw==
X-Gm-Message-State: AFq9FYLs5LOHYKBSVC3evYbiblXUeFaXMSSrOGRGIZwO61GkBWfBiMJx
	kMnpXcukVD2xSIur40qJzXJ524mn2a0dGjcpuCM+fpvAILDZXxuvVkfG0jOlxQOqsn7TE/DeBHg
	9+tikjXfymCfA47KH+f5mbTMwj2zIoyjJk3788w5qLuWSlhzh4N8J8jNaatq5C/ecMqOE
X-Gm-Gg: AYBFou2rXufCv7VDDbh1nasak9oDXJTxq3g8XZOA95Kc93+zgKH1vxFwQqpovaFmyFM
	TkVNzw09ZZwtRjv3LySbxHKLdhUnbjuTPmQtDqtci1z1pJxy37l1p7iarcvGy2eYnZFCPdbVsMH
	RMBAdU7NOfhZbKbEDXGdw7D25ZT5c9CU5qr9x1OznlAgteeQPC+FBAv27GafDkVUCEwVzs/9UzV
	6jveDWwCJEZJTFQt0Yf9jNT33rU6PnVMABRx7YBeN+HkT7ccJrna6M1Ih6m0vGWJfMCqFM46qxq
	+crhsH2AN+bpnIAZP7foCU1x4vFMl3jvbnWCpzR2DExRjlrjWojltYUwNtxXvNO/Hc0wBaaLDbS
	vN9UP0jV4fLXaEhgFOImzWKHZnQ==
X-Received: by 2002:a05:6a00:a1d:b0:886:6b5a:78 with SMTP id d2e1a72fcca58-897c6e1bd4bmr13170328b3a.14.1791959658996;
        Tue, 13 Oct 2026 23:34:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1d:b0:886:6b5a:78 with SMTP id d2e1a72fcca58-897c6e1bd4bmr13170310b3a.14.1791959658518;
        Tue, 13 Oct 2026 23:34:18 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802a47d7sm714854b3a.12.2026.10.13.23.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:34:18 -0700 (PDT)
Message-ID: <01986f3b-7571-4e5c-a43e-3542354024ad@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:04:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        mukesh.ojha@oss.qualcomm.com, andersson@kernel.org,
        sumit.garg@oss.qualcomm.com, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf2270 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DbjZ2u-6SfG84hTmyQ0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: S7SFJBvtbQu6rPY21VGm3BMh-8TP3E4_
X-Proofpoint-ORIG-GUID: S7SFJBvtbQu6rPY21VGm3BMh-8TP3E4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfX0PoqpxoAGZTb
 PmwxiWZrz5MwSANLbn7HJTISHN5/T/JbmIjPXqwcaBXXEH0k0qfcos1Wq2Fh5yjU+uPvLeLCSCl
 k3ELG4RSEN7RzI8z9JM9sjWJd3dahkfryFN16YuOWc6uIm0HMYWXZd9lQQ5iCyMkSf6RDunBGYt
 K4KnLgD6mg4HyyOPnqHtVqw8kDjz6C5iFb726U9WMqVqMsBe8L15hjEY4P2iX1DhswPQUG6KLtG
 5nlCIGaVtDK44sLEQI499l4+K0lxc+ZCoXikTcOaNRi2tesOwWVlpdSB0FgBahDFMNMmOjmt//I
 Gx3kCG+Uy9+0nqPr94CRMdYRzCJMH/U2SEAbhFEJTpLL0aLr98yhCQUFIBdCcTMGz6fT1IxC25s
 IPKaPCZpwZDJ0XmI1M1if2qQ+98OVjR9UZCLga6BCEOEjwt00TWrW5Yh7ulgHHpe/CPO2ovcjzO
 9qJpHg5CUgT/l4SKusA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNSBTYWx0ZWRfX2I0j2AIpan+b
 E+TMrXrQH7OzMs2WA90TJjasVYNcBifQQTpR38S/M/lrBv8NLSN2K5Uk+vmfUGvsbvt0PQYaqim
 e7YZ4qXbAVqunPbe3kH7h/ZaE6VAPUQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140025



On 06-10-2026 12:11 pm, Jorge Ramirez-Ortiz wrote:
> Stopping a remote processor clears its cached resource table pointer
> but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copies
> from NULL when the firmware has no resource table:
> 
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> 
> Zero the input size when the table is NULL so the copy is skipped.
> 
> Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
Tested-by: Harshal Dev <harshal.dev@oss.qualcomm.com> on Shikra

Regards,
Harshal
