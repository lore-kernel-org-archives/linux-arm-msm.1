Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3ED399889
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093119; cv=none; b=mgNmjN50oUP3Sa92xks+MMymZm0JjO8xrun0xNR/ohHoWuAoZjNzXR/bg8YmZRT0glVRJXq7ESmbKSUEhEWKeW+Oh5aFr66GtFY80Mv/PvovCkBtrTAdXoLgJshXW/WlvliiQXb309Td4yzZH7f2rKmzeSYarX8Dnh+/XjI6IU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093119; c=relaxed/simple;
	bh=rXr6ALkiHMHf713Iew4k9Nwjfd2L6V40hSe8JbjfnkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ7udf9rO3u0n0qdBQZkWartydPMo4JTzXwHZRjCMv0DanOUm7n3m1nNpHGRyJEArKDGhgvMzA7OlzmR3eCw/tl+m5h8tGuc5/s70Gnii/a0HvIwUlHoR7vTXnnO6etf51ZRE0KSlcBXVrB23gqz5Cwb2m1kHTkKpLWVvyD5gXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9HvTas0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GC1osOw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9HvTas0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GC1osOw5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UAQ91f456202
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 12:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=87UiTHIpsbJI0MEwi3jZC7kB
	bzVbhdVpOgM75F6ZNAU=; b=Y9HvTas0eG2nUXeLARoIJXIZRH2ESGSZyfFXyDxA
	U9x9Rzrunb4t4jbR6OBKAMifmIUW8DnAtODR4+t7REj8d585QvhTKTEFrN0dRUb9
	6K4nPKNZAvi9JInF7/4Dsy0p1iRF02KYVotVW1AWVqi9AIXzp/OZlaLei9uaxV0P
	knjOmCQHllHvciBvP8GH3BARzr2HKothl5P5kRuJhiaRf/8Ec4CUpPxWL3BNlxqg
	/5ZAi+yUfjileGFMZBVJ+Z/V5vzmxQosN75Vw+owa1dR49L0z1n0wSCHkUx6xINe
	hs4yFnTQVVDIWcEeU/Bd7YBxjJ1AkmXKsz0FDBFs4WU+HA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyk042-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 12:31:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fc16ac179so39112031cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788093115; x=1788697915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87UiTHIpsbJI0MEwi3jZC7kBbzVbhdVpOgM75F6ZNAU=;
        b=GC1osOw5TmSNyyv4QAwvI7ctbdZM0PM0U6HZ4w4r6xRkQgpEXDyPXb54+Ar5kFrv2n
         mVaS1CiaALHXknMT4bOPLx//xFHFvVHV3cfGziCoNCqWHt2t0s64E3LbfHG//taIToD5
         Wq2SkTpjASlLxHnz94jzSQ/NPVbyrSH+wSCZ2mMNb26V9iiRKS5Xq7K71KG7HzuOE721
         urq1Z5YT/VvnAwQDzt8uhyDdA1pjslCzM2pDFla4Ej7V82J53fvH9xuoSZrmnq7390UX
         gdRdLF0ZWkM6YFjJpb1euzsynNp+RpkkVuzGhgA5lwBa9P+jXvaUSM4Fm21y/VLD/wsw
         Aw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788093115; x=1788697915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87UiTHIpsbJI0MEwi3jZC7kBbzVbhdVpOgM75F6ZNAU=;
        b=CaioRp8zs3hRNLwHUWjG8/kB5jFnoQjZDIwXwxi/KCfX8wO//F/YmipXJIDchxdjI1
         576OsQEM6NJBepmZcq6g5v0S6Oj/PVmcRFmyUtIgLH28hsb1LxmdyI8r8KRPsA03gYlD
         QoQP54/PB5Sne+H/NuND+SCTGET5cUfbDgz9DpqJEgrn0cwf6yzd3YE1hkdpMXMks0yT
         X/xsZigBm7C/qnjC//ExjNx1ERllBncO+xtSeyDsnFE1PLZqpKySVNqZNSOXDAJHixGH
         lYMfboc/QHw+ryWfhUCk7VZiDCmdyJf/pJoV2t/hWJHn9HN9m39Y9W8RK7m47pjuHv+G
         c0Dw==
X-Forwarded-Encrypted: i=1; AHgh+RowWzFt+lZ7o+QQfCITXrvuVkE9yH18bNlZV8bvJ7HFr7jGXtmn2YxO7p/4azjvbdyAMt7TFpvCTTNAQmgB@vger.kernel.org
X-Gm-Message-State: AFuF++kcDs9fJDmmMUa2WYBqL1YCyrsY+rplZzPxjL9EH2WrL3jefoE8
	wau4RSZgtXy9Ff2kywNe3CgdIxlWltNR/FlAwg5Kkp9N8fHuDHYMJJxDMaiqQT3rdWG9BAJRjPE
	WTH4JG7mltGNMh7dYNPK+odrkqTai1aPqJRltIu+Ud9IDDQmaQmJgr2D/rYzynEAp9S8L
X-Gm-Gg: AR+sD13UCRDTj0E/M8aKk/IskMLeSKIiN932ATBHQvSq5w7L2temawyYBFTuNLWLMxU
	AhRQyFtdbwLalyCQlVWI0exUKzVn+eDveX9vZp7KxxZ9v3bNv22wSTOLMnezJLg0H8dDddpZyQO
	DUfJ2TPeXIIpH247CSp4aNHauPJld0vRfRLBsWTVyWii03zKlUltkh0A21f19Kdx7Gnk68wrJcS
	VwD72hYlXQ9VdXE6DenRrhmTr4HA7ZEz9YpDieAHJHNkOWpmXpEZHMnqHHSbW8C8TuIm780uYfT
	C6fSt91L4UlX2ly1J1jEpGIEuoRXF9snRgiduaTLue9WyY/EqwjCkQoQ1dJ/WMWJs41Ige+JMwz
	KChrOWzHozJyqWQ==
X-Received: by 2002:a05:622a:581b:b0:52f:b77a:fdb4 with SMTP id d75a77b69052e-5300b74845bmr22446531cf.2.1788093114936;
        Sun, 30 Aug 2026 05:31:54 -0700 (PDT)
X-Received: by 2002:a05:622a:581b:b0:52f:b77a:fdb4 with SMTP id d75a77b69052e-5300b74845bmr22445931cf.2.1788093114428;
        Sun, 30 Aug 2026 05:31:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm91156865e9.3.2026.08.30.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:31:53 -0700 (PDT)
Date: Sun, 30 Aug 2026 15:31:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI
 nodes
Message-ID: <3sjdjyd6xgy6il6dsmhd5uak4fms3sh6ltk4y6abvr6gh7gcsx@sqeodm4js5wq>
References: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX51i7L4/9rKX9
 IyZMVtdU+5j6mmdGHsy321UUoLfZ+xce7NeU7DQHCvXYvewtld4u0zoNzML3RzYnRvfUzvMwBxs
 3aTWshoc8beFKZo3PgOpEnlo5PEBWoU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX9yt9DADPNupp
 RvZnZ9RQE5qPbRP7BzVU7BALLaE5TyGukxIozq7RuZtauC+Cn5cwKzPjt6k+thVab4FJWpiWTg7
 SiKCaEB+G11A/9aMcwQ13Sonqr7CHDif4kvGTMqQlMra7k/9P6WcRsyjnGJZWdT/gdLWd+Dzcwd
 9SZJ/zYA6Xs7p7m/LMqQBmqYf0Cxgyr6L4jIOqzzAj2IfplSRLxN4Cm0VtoVnXSHJ1ndiLrpBiG
 vzqoYiaIiY+YaAltcd28vja9DcnwHtMpUE85Tg7S5+DrKlI9BY+T1X4MvMYyY/ovBm0N/4N/Ndt
 4Xb9E+kFX6yOzmYzyflH+AfroYHQVROiJrv3UjEPr4fdHOzYl5L/0pQoF82FLiaIWCwTPQp8bAN
 lSO1+FsTWELAizrBDEPXj6wpjSfhHjm5mZ2FFrSctJJRxbpSwS83/AeZ3QY+U3MaTcwMKcOqoUP
 lFoCHlGAQKaKmEn2Eag==
X-Proofpoint-ORIG-GUID: tDm419NnhpdDG0-CapgIbEv5J0PlWJQP
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a9422bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ptejb-WZcwQgoGJDpb0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: tDm419NnhpdDG0-CapgIbEv5J0PlWJQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300106

On 26-08-30 20:26:33, Shawn Guo wrote:
> The qcom,bus-id property was deprecated by commit 345fbbca3f76
> ("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
> referenced anywhere in the spmi-pmic-arb driver, so the value has
> no effect at all.
> 
> Drop it from the remaining users to avoid spreading.  No functional
> change intended.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
