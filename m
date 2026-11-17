Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910108;
	b=ht5Wdi3WNcJNzK2eNHAHYlOsxRPWOq22Qf3Lhd22cyTs5/JAbtnIwO+w/kGYgAKCwstG
	 tSVPY+l1dTAjszePnTDfjWtMNijS+YFOyAWFK19/lCfqr8PSDZigIiIo9ECzPAiSN93EE
	 iB8Hd4wVSpmLbFxI6iNuOM2MjydqbpRGQLi3kBhF1j9nI+QokodcRKFdGvfF1wxe775np
	 4ROxm3NP4HtGb6M9N9x8UT8S9kmsp1ke68bzDNxlK0SU72LLZcTCwPoJUShAoM9UlrUmG
	 EvONWxDgBce6tS3oJyGbb83ULTZdY6nNo8NoHFb0GimnpqouWf8Zq/FGym5E3JPsztA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
	b=kiRw9/tUvpflxCpfL+/j7wY8XtnyjEfFHN+BMmr1ZVAlWI47OPvfJ1jvMoK7HIPpfetI
	 tli1h9tba8p17GTgQxf/VCJtxgyfvr74zy3g45221U9De5b13ZcPGLvrxWNAt08IsGO5R
	 IloEEBOoBekmuWib+s3d4P3CNuBiSQNnJWar8cSuAC9dfnSAdfnq2/7SC81LS2RSMQDQM
	 ZLZ0cSANOuzP4Y28jPsNmTWk9r0H4c0nVlK7jlors4qloTAm5M1qs7EdDL/izTh2giIFZ
	 PDRELxdT39cjBqDd/iqoSl/0TdPZfiFhdKX/ZVyVQa0DNs8XNA6fDWI/TCiXi8CgH4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E02606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E02606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHA4xsZ2790609
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=71/VVXS9BeuWmakxmuuJ3siE
	vp9CNaloZsNO9/RiEQg=; b=AbQRl9SpgK1WuJyN+6dJi9yULWVDP2AgW/J6kEMC
	BS73aQmJLCFctBdD0PnGgJsbLJ2ndqieRJPzmld/RKi57wcF47KGYBHPIQizv26l
	BE27Jy8zCAxbYw37LzgUKRLAkdK2PEayYSBdTZfvuU9waqvb4nqFnYil5AcOuanw
	7hNDYswvpwAqW/uAujNaI8MQ0qiddi1H4MFItvQHcn9kGtzx4Tlngzwt76NKTqXQ
	hqIHt+yfCvn9f9cqdsmBWwmj3G8PDkltdyDZCk7G4gaJ5hpZkapMCkfpjdgFe4eJ
	FdidEDDLSwWahWhSx6OC6r9drR5L6JbOlSh8J0J5vTLGyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv100hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94970ad532bso400206685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910106; x=1795514906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=caePMNocPmZTF8ew3Q/1HZkAh6u7Sv2rw74pQl6NkzugOaiNRL56OWFkgmRs3ulNUp
         0ZK3ofM0MAt/UH5IjvC2t9Ewskj1AT3tt0obOu+nMdvv3q/DQN66QAvOCaItIbKO8s8o
         SemTzQpo/0TKovEOcZndkSQi46BcUrYlqqIc1kskJPGWB4f/xs96gJHGMApLVzggRhKZ
         jF+uQxNuwWXxbOlhtD5aWz8No07emfRcKDME7ux5yBfco+txUGugf9X1wjTGZW8uTc2M
         Pa0GmsQ11+fBOCpjG/qP3eDHmY1hR0njyeIFiqKLF1jdK7jEGKlthaVh4Sb7IjaYJp2W
         dnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910106; x=1795514906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=Wrgp0HjdtsLElbN1W2kUg24tODn8Lj1bqLG/nbn7fVDZ0ryoLMeRwBPI5blL8zXzEH
         UvdBQOLDfRLfADPlg/5gEgXkwXXS0NgLKMM2Zd+siiFboQ4hefz0L/NHDrFRbI0VhYLv
         Xi2+7xgW2n2veOWXd2mgZQIUAYk/FEmwU5QiJibg6aBzMMBcsdgsQSVDsJhoJ3CwhDiS
         ONpr9Un5cv6nN3L9S3JwdVA1kG4Xg6NBcNO1iSMAbAVm4WiT3dNOtU6ZKwmTf+DiqpVt
         BpR/OdCuzMigs4T4Wj8zJ202h9p0mUwrjPq8BZ5kVXfdjTAqZXKKubgurpelKPOXT6Qt
         PeJQ==
X-Forwarded-Encrypted: i=1; AL+hErGzH4av93lxo1Og6Yv2tAK7d3KNskTi+GycqZSSENiMdX23puSs6xhUuXeGS3lJu8o7A4ktBgZhrkjRwcRR@vger.kernel.org
X-Gm-Message-State: APuU4Z+MIrgfw1DidjdIpBOBprMoU9L7Wi6P39uDzYAibv5KT69/RqqA
	buX4XonSFuWyaS10MBlmxVDm6zpsk96M23lz314ZOLfU+GOMAWFA++pBvkaQp/wPjRtuD+WzR+O
	hfklX6xkLmgLekuiXrG6/8FUM+CMgGfmE36Grwgv/hHNUyrHm7YzjiTL4rUYcW6eBagkh
X-Gm-Gg: AYBFou0mnAPTiyaWxAVF04zFeXakokYl99ckoFW9BCf4SsrRXqi2MsKs4+ngxla1JL/
	ATw0JPpznqPdYw7LJRohOnOk1wiOE6KDqHRm+IRP/LeRDLfj09zodEnpgFP+wQbjg+gWwaceHW/
	aUjyp0rGc8cK6sP7y0C+vFomKbW4JBdv5QLDzFtyfuAr9s8SMN4IIJiSyXBSKQ45ZnKNV2mgQQI
	zYpl98h3ZY2NiYzDoFZCMGIzuD68scluAKZVUMNlLXq0VP1BR1/AEMld64PJsvcWF+59Nt3Fndp
	enDz8MESsghFOH2f6BUA1QTc8XqfnP8HIaM3mm/ptM1WWl+/7uOpVN8y+w/khD7YYtm0D87xcqq
	rizYqyx9r65r/NefXt2XwlcLgNK3U0zH4afAyXYkG9L1VfcXuRyMgSF/SKTjKazsJ
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050251185a.2.1794910105556;
        Tue, 17 Nov 2026 02:08:25 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050246485a.2.1794910104932;
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm69006895e9.2.2026.11.17.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Date: Tue, 17 Nov 2026 12:08:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
Message-ID: <butvfwbrzocwbiftgdssebxnlotirut2e4ub4few4e2am765ju@w3xluxibav3h>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
X-Proofpoint-GUID: O4TmenYefYyzd4J_mBgF-WjYQQFFmSJZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOSBTYWx0ZWRfXzwvqO6NiKgRC
 YMTMQbe0rbHo5cbfr9HEjBsCq9k5Xh/8neUERwmY9mIj8j54QEAFLJVaVwR+c5sBl2baSCP7d/l
 dGJp2AGqCXyQ89CY2ft1h+twZeddSRE=
X-Proofpoint-ORIG-GUID: O4TmenYefYyzd4J_mBgF-WjYQQFFmSJZ
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc279a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EICV59JFKgBgiyABiDwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOSBTYWx0ZWRfX7PWgIWTHv2Cj
 CGnfA9yv26gEH15LAQIeHrpPgnz1XylxBg0AuLEPF/lyBq71SWmgub2h5UlqMNf9IDu1TDvw5iE
 APwX2ej9V0aQh5/JxEIwNgrb0kmir/t7w0z8S2SizhgkeE0DKTB9Yw1BwZWW3mlzleVnLeCK1Mq
 t6wnpcyKro8RpB9mdZNSSbjmM4rU7tcuXUMnA+GGMRBMUiC+M0SHDU504/tiB/BnZfl0mWb+TKo
 Yhvt41wnqsrwDjAuGW1i0qMQ1NINHNjWNYCeXHazWebXuNd435pMgq+V/6RjbigIsncBCtTfbe3
 WhOyR2oAj0Q20BI4J3dMjYlZssZzoHuJEcsi533P1wJIUgUgqOPuxFyRs+gTPhGGhxNXv2cPG6O
 9VsAxnktpBQZMUFJ7GkDIuKVJwEMOGgSdTH5//HTBJwXlyz6zx2ABOGCn/DwSOn7psfVQyjE1p4
 JBXRdBfEeSZiU6lZTPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170039

On 26-11-17 14:34:34, Wangao Wang wrote:
> The Eliza EVK includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
