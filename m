Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318AB368D62
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371790; cv=none; b=OTsZTxTq7VCELhlIoTd7uhjUuJc8p1Tr0iurmnAOFxl53ZEemPgkDxm8wnpG+5Scx3K3C2LdqLv/IgSICSH7WyJ1g2/CQWlXHWZ/CRLyKeqqi8wkjAstHAH5s1L3v6Meys4ZE4fASeLOXdhN2ZFRBPe4A1rPGicbUjRER9a1jpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371790; c=relaxed/simple;
	bh=ljHtDQyFU2tg4WF8xZYYgdWm518WsXPIE8Ro4FeiNhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBIgttWqWwxzq1UjDOb8SJ7j9obV8CHQjMF7xNE0MvHLtnNk1VDC0WOgFjMHUc6DVgviHxDvQ0Df2ARUiVes0FhF/UXhneNWLS/PotiDujow3CLGpG110IHn4tFVuxLIdAp7HPKEpJaDqOEB8rlyGa67SjCSEi4GgS5YAIWEwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbW41ToP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Owpijvz3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbW41ToP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Owpijvz3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j0Ii3901329
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sj36ILgqyvhrxLK3acAns7/I
	xSKN/XaPnzARkbVNGeI=; b=LbW41ToPGyMJ1uwdWSUVonOYBXMewzlsbs4Y5lKo
	cf7JYcuF6tJLCOtnUhhUZCGUHiv5bGNQv6tRLofAJpGyfrXgvMjwWYlrC8g+8ghy
	QOQaRAsrZBXfIPPvv1h11JcdZ05N6QqKcgL5UvCMDRKZwdy15cHWVilTaN0jvdEH
	n2UKsItKzI1rDpJe3ZoSqjy9hULYz7nTU1OPOUR4oinQ781JUyjF80H2E2DRB9HO
	5ANZAkB/C5GvUls7DbA/5q5YZBqr4nZDLCEd8g5aiFMUSX2Xa8kGkjHyT+s6cHAW
	GlTqvrNnvuNPuER4OhYanucHHP2lWocMIisfdZYAqGrECg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5hye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:43:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9102f07f2fdso78234246d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371788; x=1789976588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sj36ILgqyvhrxLK3acAns7/IxSKN/XaPnzARkbVNGeI=;
        b=Owpijvz32PTdbpC7YTb55IayY0wFFzyGO6wCEi0chXzfdxv3rak+zVGYpZGgpplxk/
         n8QLhCNPsaAsJhk+RPcocUQc3sRbZ31L6IqasexGca1/xifflslrhgDH+CX2fwM/dwkA
         8QyOjCTCrwEQj/0tuA4oaj+kCVdh+TbHKxySlmkYyV5v4xi/3O7ClpGJheDqm4JTY+rd
         XIO6VAJ1OGWVcimcclTFbYJfDcw9mcLHb0d9Tlex8gHOy+qtTtiq2iESIxhy3vuHE0s7
         3cR1uZck/vR3dzcW+D5jMyzv9yePdL4bGp7Sjny4abZGsJUMtwFJYyjXYUifXHXA7ba0
         ZLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371788; x=1789976588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sj36ILgqyvhrxLK3acAns7/IxSKN/XaPnzARkbVNGeI=;
        b=AnViym6LHYE1+xlGvp00LKasgi5OGdNfCcw+3wKFRSpG2MzF/0y+x+QB7m5p8bnPlY
         qN8tbbyhHt3fNKulgWA4VUWwYw0OAzK5xZctc1/07zc2zQW4KiBV2stIUMNNAfN1VVST
         0DBL8IVo9/VOPcGtDnDEH/BCVGVPivLjYkcVvDwi5bI++1wsteYKpHQVO5fGh0TL36S3
         IbqdX1aIB/eZJ2dTZhX+aCrsfCCvL9A1moRZDNd/AZOwnkfJZKNqhxBWxKx44VS7p55p
         Viykcv7QVUS0BOXiiWTIURaF2aJqi1SYPtQpmEi5ivjhk2riIrd/NkbvszHnCJeyyAI4
         avgg==
X-Forwarded-Encrypted: i=1; AKwUvBxl3FYZCn4XQ4NgDCMtw9/eZXCR3n5lyCAYd6YRCmO/i9wjOBbJ7VDihYEIgFIFqYkS5Jz6NcyEjVFJ0HzY@vger.kernel.org
X-Gm-Message-State: AFuF++n2oc93cNhfzRkvIx54VN1JqFxnBn4PQJ4/PJCXt2Kv0FHr3reQ
	QZyX3p1jq3rrC21tkVL/LXJYwKtA8oDfnoIVrJLwNqJ/akxaY8yyJtVieoeTkl/5LRi9H+SMBVV
	/9jw+i7uimD9QtTPEEs7wo+u47YxeLid4jkqyeICEkvVJicImgO2GHlANoSdsjuxq4Azk
X-Gm-Gg: AYBFou3+l8ZAJqvcbMglL3ZsHT4lYg9L7rHkhFqX8/c5gBgGXx8RbhPDi5Ftzd98eaQ
	iMbMDhcpWe1mtX0Xeeyo6THEqA7Ji7Hctas7DY420YVJ2t3kyfmHLehIVQAmCGK2DTgUuTTFS2w
	qVFdE1YCf6xIc3xKt+OHci0r+osqHjFJHSsm3ceBrYmEvZM6sofo4Zgdwc4AvOaxmgBpPqKKYCD
	im/WX5zQ7xLOEugjhfC/vSY3csRmyun/qtf84zUKjL3Hjpv+hTrJ8oj4SnW+DbG1648SHNkxLQn
	VALkm8vDmvYkaa4WvoxJIk5NOxnsWkSrSXwyLJZRbr1dsVqakkxRP9DgcFkoZZhHGr7MFuZrq2F
	irbSKtO9pKlOl4w==
X-Received: by 2002:a05:620a:2814:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93a185a63a3mr564002885a.11.1789371787553;
        Mon, 14 Sep 2026 00:43:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2814:b0:939:a1d0:b5b3 with SMTP id af79cd13be357-93a185a63a3mr564000685a.11.1789371787024;
        Mon, 14 Sep 2026 00:43:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e8d1sm25205655f8f.11.2026.09.14.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:43:06 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:43:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state
 names
Message-ID: <3kgqogj5q4ndryoj745ujrphpyztihmjp4f3otdsmso4pdkqzt@n5s62g3fkkat>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+e1xvpOUE4mR
 7EsShvJ/FJXqTLenBkO5RtfN1zGeM2mgCT5izzWaTfwWauYkvou9bVuFgMbtYt89OUN9KBgHkK0
 ZAYMbR1/osN0+wIBjXvuBsXG9VtzvwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX3vKNMxh0Y6np
 /cJ1+BtKWd+nFgU9X54bYS5KZWhZqVAnvjIZRw+ORZyJgYPYBSTDSQBUBPzvdjWpPoe5z3GXxHO
 mnZk7IbmsxVREXo0nnSdzBJf5cxYpqdXQarT/JiofngHHpvZJnPD0fvHIw51eDOwkDMEgmDt3f1
 BuxH+zDZqj3sEQMU/VD/ZRtbKGK4XT1jU1V8lo63bBmXflisSMsmFvo+fCljwFXgSTcRHMN+BtJ
 ToFBam6NKKAPLD+Ulm08JYxzhlfbf0uRxqOpE3UywoRQdB/H+7Whx5KbDGl2Ip6eCH9494Sfq7F
 TfrPBJ1k3ybI7crb1i/C8z076QKxW3gvp+zbJLbLDFJRLq+erq6CrZZn5mKSIMipYPkyqFr1Sj4
 N/Dtorhk4YB94oHw1QYf9Wmje7djI2HgBWa/gLMpCmunN60DqNuq6e+J6e3Wry69jo2imtI5IeE
 jJIJqWN7pVAw6vhRytg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a58c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: QwEoP6QBHot1hA-HYFWEspaZrBD4VOge
X-Proofpoint-GUID: QwEoP6QBHot1hA-HYFWEspaZrBD4VOge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:30:00, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
