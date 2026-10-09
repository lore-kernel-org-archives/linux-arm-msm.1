Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D56C4F30E5
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569951; cv=none; b=uu4iFNEMFK3C/hArnYHzM0OF7m/JrPRduA8b4tWST6ZIN9qnTr2yqh6jFviPMKAK9MwAZOW0dAbfyFU22QAiga+N1/MqMh9khp3iDlXXiKpZh6J3xvqCoTVUObUyOOYO9oEO4iLajsY0ZdokL9ySpdhO2xonVVP3dZa3EUjyuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569951; c=relaxed/simple;
	bh=Qvh+KR0Q5Jux2MATytmPh5+5juJq60zRMnUq4HRcvZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pc9HxmIziU6PMp1/tnfvrNTUucAKl81+TRLbB4IPGLkSv/Eown4DpbdYuJdi/XNjEQTkbHhGk/pMV1+f73ksGOx0dE4knkHugYaXgoKBu2i7TVwB85ylfIYVHiJoinn4RSjUwRRDcNY/wxqxVPObIdfFXSqfyJlZ7COhotSzNqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkiQIo85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/8b12U6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkiQIo85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/8b12U6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZSeY1620401
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 18:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fX8nXEvsmi0VscUpFMXtxoP2
	QzTES/GfQKJn9nHIr60=; b=BkiQIo857Mtx31sgPxo3u+kI528WAZvTZHR41Nya
	nSVYBOCaGXKRFJuk1XvQK9UuTh/FjXnT1X04F619pZMaeJikUG5KtjUgD5wEdcfD
	Pf3OdvI+cc7HuI2/dQXn8Zefc3dntvMFaWT9wB/f+xVJH3hHMJXuZk86my3OKMSE
	MxZWVrohSTGIlX8PZi15gXXygmENk9NWY4XxZ49pUoC9c9LjcoSutAB2d8v3FM5A
	vzWKxe5lI4U8yCz0hf2lp8aNl0J0K9s9/E3ZqG0lkA/L2NOvLndRbxZn8lS0Gdj3
	BwUC9oa2FjaL9PuPBG5OS409mGVYJHrQdTCNXmokQLASZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t705j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 18:19:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc40759b2so1438453185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791569945; x=1792174745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fX8nXEvsmi0VscUpFMXtxoP2QzTES/GfQKJn9nHIr60=;
        b=e/8b12U6lfS1wUiLUgG921UShCw+/nVT+aMyYVSxYL6+fkB6C/AquJk+RIuxjBZrYy
         Bkgp6H0BcDXJTCduudbI7PBZjWBKhNY0vXgkuLhPrEkNDfOoczNig8lnQqjaXjWCR8l8
         uqdbJie4ZZC0Cw8RvjoudRFL2zQnGLuh3FPgkG4gJBEF8vyRW1fEp42nVK1QCbFU4aOp
         Wcc7wtuCDshBca6pTgsSZ98/ulurA6c8YFlqmyBJfDOhMht1UnCDErq1qRWCi+ZldR0X
         e1RAYmQbCpTm/mMKWwY35BpljrqSJpBCP/DLXN5vahldsf9Ywxma689ML0L4nBuuDi4L
         GrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569945; x=1792174745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX8nXEvsmi0VscUpFMXtxoP2QzTES/GfQKJn9nHIr60=;
        b=IeMUYxrkalaNog4CMfrSchHY2yQV3JtEmnIxoCZyYWW/RScg/z+IrJS21R/RZPWpGY
         LFZYUE0HIcejZbwWElzyssQ8uvAbwiPdVffF+hCsYtGbrbf/08ZJ8sDMszuONoBQA3Ss
         GgilIvUGQlqwAsDvAc2RjVxMyPCGwIfV7VsuPuPhXh8Tu6VPLXKSfV56LOKblMBYru+y
         B7TXcKOQDiC+1vL+4Sr1oZv0nztFYRWr7xcplaHlMacTNoGF+nT5i1juTK/BrRcYXIew
         KNt8sP5zKzz/6QvaGFFtoUModd08JRLRhluHvZy+mXn/w0yKDMlZw4m3dRhLZKJ8jugT
         Uu7w==
X-Forwarded-Encrypted: i=1; AKwUvBxZAx1ScyojxWq4mLZwvc76QYAo+g9NsLl9MDyrctuKRTIQ73VKLemrQgYQouvTMO89SncFkiyHdDIgmEY2@vger.kernel.org
X-Gm-Message-State: AFuF++nsIt9BgUm3083T4Nxg2HS65kF1+BlT1jJUCf/LqXq1UgcotABq
	iPbNZTowcwCaMF1vr1jVn6UKFHqFM1gfcYSBtPzp6Z6dJVrEqRnRn+y+3zSVne+G7v31FClodAf
	uEr0+AVPCtx1BOww53qHMt7AJefs/3goRSdRA2soNkdZTjVrHGFH19GoIRzGhwu3a/STb
X-Gm-Gg: AYBFou13LM1lWr4S6NJTS1UgSlBMSpeCRnDV+j7QWXEstf0ly4enAIL2safFbSf1Si9
	iVTti1oZdmi2ro1qWXJeg0V+QD5vbra+hgpb8gUXsVdrxO7OSdvQCnMi+3YEi68A7wGywHjDmTV
	xO0Ov8smTY7CRuBtol8r9IHMV7LPHjUZZWlbV3Tlj7JiyNGgr7vEeOqCVMqPQCVHYJvm/Ydsrux
	7PY+2TAspSG85YVAgUZem6hDiLuwcnWPQbwefzI/C6XSEpYlUj637mZeB758sRoNGLC2wHF8FYj
	IASkW4BzK+EN6Cm3nY54+ALo3skXjcbJUvvqm8w9LlCwsz+RlXndGLbxxe8CVERcMLB7SK187YR
	K+xkLa9tV51QFnOU=
X-Received: by 2002:a05:620a:1725:b0:93e:94f2:adaa with SMTP id af79cd13be357-93ebd1ff9e0mr444530785a.32.1791569944483;
        Fri, 09 Oct 2026 11:19:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:94f2:adaa with SMTP id af79cd13be357-93ebd1ff9e0mr444522385a.32.1791569943753;
        Fri, 09 Oct 2026 11:19:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm4937405f8f.37.2026.10.09.11.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:19:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:19:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
Message-ID: <3v4w6edwduuayl7wkq2h44iikyx5mtwxer6ihuhsoe3t25rpow@d57gkwe2najp>
References: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
 <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-ipq9650_llcc-v1-2-572e40b18522@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MiBTYWx0ZWRfXwn7yc5pkT0Wd
 ACOAU59PZXJoucP5kYWK0SZcHwB0eri8T0wEqkIQ6CSrtcknnvI3obOtZW1ot6lenO9eHX2Ay+v
 /yXc5NkUtUDdJfuxxIyqM59wm5mQyxNN7ObU98aw2jBEnisG3FFx215OT8FP6YDisDXAcq4aIHs
 TCh8bKVxlm455+JgKkDh9m4VO7zrHpdlvSQLPrVuObfhN6RDjBD8TTzPZZgscDsFUJZNJDCkCay
 S6V4hilQ7zI3sfCGPCcMG3DUkZrMR7Nkkv6fL4Gvj0KiKTAovn6x5CWtKczkMXa3SX8YCR0yPR0
 t4Kjwg4yDweKiR/0vjwCTuIwO9LxIRIElmyiDgOnxmyPt5XDsV/x+yIkVQ9ri1zH1ZF6e4dSPpx
 nFIGeqpGfRmsjZecyrx9qfi6g2qBkjA3exzgC9vo4BUZJfJnebmmbbIO5oOL7BTVL/rlQip3qh+
 GIc1dl9H53WBjP/79jA==
X-Authority-Analysis: v=2.4 cv=Zt94uN7G c=1 sm=1 tr=0 ts=6ac93019 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DNjmE0xhf9-nCuXF3MAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MiBTYWx0ZWRfX7Od9jD8Tgt93
 4WBsubZsUWvkM7MhLKBdji6XHEui9UODGazNKXeRxWj/44jwJd8UF25qCuutND5z/HEda/btnhB
 jrOmkH9ORJemAHIKrjBlMtBdVDCMWSM=
X-Proofpoint-GUID: 9pV3PRYnCbehgpJyyCSeht1B2lMX5Jmk
X-Proofpoint-ORIG-GUID: 9pV3PRYnCbehgpJyyCSeht1B2lMX5Jmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090072

On 26-10-09 19:20:32, Kathiravan Thirumoorthy wrote:
> Add the system cache table and configuration for IPQ9650. The LLCC
> hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
> no broadcast region since there is only one LLCC instance.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
