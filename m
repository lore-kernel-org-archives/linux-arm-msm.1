Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19E3B774D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733226; cv=none; b=F20Gi9BvW0dE7njrtJzWlwlbxVT3sFBo3b9HwsfLxXoQm838DbWB1bXNqE15Tw3Rmd4DdaaLJdk0ws+EugwizUkJ7CxJPj0JvZe4BgOjGdXHaGYKHUqXbWcErfNINS7Rjeokd+grcD26F9quMkT+nwELZTFvfqh/TRv8dX0CfHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733226; c=relaxed/simple;
	bh=1s/hnNv+eRVrW4DraPfnP/EbvoEBWNKlBOd+VCDdCgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkCMKOPvXAAEhB2erlPN5B6SL0DTujNtFsV858jW+jhPaq6I7OjU6igcWeaf3/EZe0mVEQwIHbxNXSIXNOPPMNF33NlndnBZAwYuIqgk436v8OliRllXkzdx6Hcv3gwuP6tCN2C6hdapxL1pbuZ9mGYHXaZdlVqTPaEZdRZBA6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+cb9x4q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuiO6CW2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+cb9x4q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DuiO6CW2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RlkW3783819
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wdVDYVTOKVyqdmsS645/m3lW
	H1189Fxw062p4r2LpzY=; b=B+cb9x4qVZZ3M8weYRaqFSqAgYni99kPEq8cWKPT
	duxup21M4vBphheDu9hyljfR04R874132mghT18Hcq/VyVmBuLyY2LCM7G8X0sNb
	Isez2txqIpS2Om7fNxEQONGCv2+/epWKZGvAteplqCC3kvhXvvLfrvmpjlxYy9Cv
	XA3TKIHxY5kOBiqOkYQwSTOgqqewkWO2dI0cUBCzsLroQSCqjcQerFt5xhh9fOu6
	Ei+/1OqR7YNvx8w3pS37fNuACgxxyguWePioRU/FncRpWcqG4bmnTb2Z1FJH0UeW
	V4ayxCON9mH0GSG89oQUNTZJSmRKDMHF1tsphXvc3csGQg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g8wmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:33:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so2235482a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787733223; x=1788338023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdVDYVTOKVyqdmsS645/m3lWH1189Fxw062p4r2LpzY=;
        b=DuiO6CW2m+dt8AZhEdWwJHpWiRapKRXY63AaHXzoHFX3v+LMKn6+fWOL9y3WzBbeRq
         4v/deEsf9ExN9vD4Yjjd8xg+E4trVLQqi2eYGpVW1maU+QznBLTheAnrbzvB1Hlu8Bgf
         5nX4NtODrkmx/OPCMqEO+fe0i1RQJMkrcguwI7Z66JgHyJxZ0pdC8geBvXPO2fZMtTji
         TG0T+cGS2i17Se9hSApPLBJSc0YyIIHhLTXy3SVsh/lUSFmobCWS58M6HbqIdSoRlyKy
         1tdOtpJYtzDo649crisa4EYEvM5Fk6lf5ZBKqBdLe5i7FX68deQQnikCdLRgzLgD73GE
         y8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733223; x=1788338023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdVDYVTOKVyqdmsS645/m3lWH1189Fxw062p4r2LpzY=;
        b=XFQvQPu5vR8CSisZ7EFG+42fBh/QBG48qa02EwX3QZ0hMRZU/57/kJ8QPDNwxM7XZG
         JP6Q6/s4vomfWcToSTMWYS1OwtasD5BFJPFKWd6j6To+pqxxE3PL90ngrk+maK8HVGIc
         FvMmuVWYNiBB1we8V4W7x6dl9RAatRw+iYLf+JR3kBeVT46GFuiIbJgoAC0sMd39rjoC
         8XeFiR5Pcxej5sK+huZUwuR3Rcd683OSgLNMBJ/g0BIZGKQpWvjgVnZZ/5aYVfkfv2T1
         u5okA1mNbDB3+mhhQPvvvnTtsbJcs3aIc4vLgm71kyEHv4F09N4wkUirjaDyq+QXNu0x
         XtPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeXrm9zkfR25dVUaPUxon76wLW8wtWwxWlDFnpt7tg6ThDUUQ5YDe+xFNCzN6uR0dU4k88V8FRWtIBujL2@vger.kernel.org
X-Gm-Message-State: AFuF++njxLsfV29IOx7zLdyP/Tc2z78XREfLq5ksPp+tOXTN1GYMU03x
	wY72+NyEAzgD8Az84nryKQeE7zh2afKatxnFHWW+33N9VtnONLqkHOqEDiYJI3HmoAUBkO2Z8bE
	oQ0KmgkMSYn86K+92VeCbr78OzzLsD/LMPJ/CaIs/lh8Ahpbnwhk72Yug2uB68aS4oEx3
X-Gm-Gg: AR+sD13pUCBB1N7xR8TZefxUiOuWEzcCTVf98VPp1bQIvUvoRq8U7i0fTzIB75khStA
	ffn0dbp0s9ie7c81DZB/dLwnLZhRVhQoIePYYYFyXRe59gPYvY4cGkZ/+sO4d5G31hAQUsmLviM
	QUTjrfHKcq7Fsh0phVWTh/IhAlp/m1DFWl1MnZ0auR69F68z1zJofQGc/Qck3Zs6cTFgWr4qFR5
	85R6ZlRXtLeIqPTEN1f2kyViwt1aFoYtPFJzo9Mj2vxL3EWJl8DDLbF6igwN2Rj1rgxaedulCSx
	gaF8N6kTpOALVVXQcRmk6bQQk3d/pHgecg7zLICsjhKCSQr7WCeFZjDb9hlVXRSf3KGeWHDlg/X
	lJrZH8ULwYjHfIQFr15ceprADZAg=
X-Received: by 2002:a17:90b:1e4f:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-3966d5f8eaamr10259382a91.10.1787733222801;
        Wed, 26 Aug 2026 01:33:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1e4f:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-3966d5f8eaamr10259271a91.10.1787733222268;
        Wed, 26 Aug 2026 01:33:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8c4e56sm6032015eec.22.2026.08.26.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:33:27 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:03:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, konrad.dybcio@oss.qualcomm.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 1/2] ufs: ufs-qcom: Restore HS/LS link startup mode
 for Qualcomm UFS controller v6.2+
Message-ID: <20260826083312.uprfo2tgwp77vkkb@hu-mojha-hyd.qualcomm.com>
References: <20260825145203.265579-1-nitin.rawat@oss.qualcomm.com>
 <20260825145203.265579-2-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825145203.265579-2-nitin.rawat@oss.qualcomm.com>
X-Proofpoint-GUID: RlMMZFSp4Nh__VMcAo_p2-Gs_ez9BWG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX4sp8eq5J+aQ7
 Jdat99c3jq//M8O7mG2uDGu0kIUTnF4MmyYqVbHWICnFp+ZjAFO02loEHFq4U9M6VNDYuFSCJvN
 FxidX40LxPUZ3RHTB09Kzh+A03UQwPeA3yv2Q5yDOTkRGGITdUqQpK/eJFMHjlWhG/qv9cgXEDl
 k9arljbnN9nnM8EfHk4Ejcy3LxIUJ07/oyo/pCigkCtphVoDmef7n4XFk2aMFFw9rciMb2d/q5p
 zT6+4090J7EmHivuHl7QjK/jWpojqDQkW5oLJm0VydqUMW0sytr01TL79c80cIfxDCdLRYbN/qr
 6EbHEDiMUQ406z31oxQHtK7jXOJGQnAdXIz/dBEXSsoQMCNDocLuXHDA8bjHXrba3kMdDxU9LRi
 jYBhlzQQW4RGqQCb+BxyASWo4f4Jz9Kzx05228Mom2fQAsqMIYnzkFzwrhSFs3n0H+v679IqTiH
 IOyv09jUtoXusD5M+Tg==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ea4e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mD9iP5WZsj5b6qphjP4A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX5hEhTOJ5m1Ux
 Lnh2I69GlY6lti85rBfHZM8qVQhuk2RQ+aVDZPp9ZPvDrhr1/pS9C42vCKce0htmZ04Qus040KT
 ruqS5cyljLRCilwMpWP4dveMrr8x2Dw=
X-Proofpoint-ORIG-GUID: RlMMZFSp4Nh__VMcAo_p2-Gs_ez9BWG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260070

On Tue, Aug 25, 2026 at 08:22:02PM +0530, Nitin Rawat wrote:
> The link startup mode (HS LSS - high-speed link startup, or LS LSS -
> low-speed link startup) is decided in the boot stage based on the
> bootconfig GPIO. This selection is carried forward through the secondary
> stage bootloaders and finally to HLOS via the spare configuration
> register (REG_UFS_DEBUG_SPARE_CFG).
> 
> On Qualcomm UFS controller v6.2 and later, bit 31 in the spare
> configuration register indicates the high-speed link startup mode
> selection, as per the Hardware Programming Guide (HPG).
> 
> The spare register value is read during host driver initialization but
> gets cleared after UFS reset. Preserve the spare register value during
> initialization and restore it during link startup to maintain the
> bootloader-configured link startup mode.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>


Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-Mukesh
