Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421000;
	b=ISknSR07+3cZuizTs7S2I5qzdr5wYysWwyf6nrcIjddnh1tT64wGhLKsjgb4+mOxyzxS
	 tQRIPAmiK0hzWjckX5nkEaD+8NH/k4Srhc7ibtLwBGcnUswat1yVRLFfz9Iwer7pwd4oX
	 z5J9OzGqIveOVtoljOf+HoX/QxJeU3MM9EE7tbP23j/P8Mv1+ln50dVOD9vXG48zjzBYA
	 MRJfZK8R2+cHPpmAw/rHqJtyrI5OkH2Avg3Wd7fhI6jdf4K6d2xlgL9c2ve5uomNZNB8W
	 qnJaFDoJT7bg5ZshBbcF5dRfrYDP1NIJCVfg52CwBJiAwZuj8sEdS1iww63WFtLrO1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
	b=OFMj0mKL9ygELabUGzT1NCOLpxlgcNSoXics7FTtvHjzfVgpKj6ktQTIvVQvffEzSRVb
	 cMvW/oPKiIhsOprsrCDOB7R57TfU99xXl+r3bPW5tPUuic4ZnaXjtsJgH2USynuifFGXG
	 cWtMVsJ7z7sNhEPZzPex+w1PQBUgrof1C1Ka8BWsSoo5T9+1qHSo2vWEl5RZLvyXlMLyr
	 vxhlrpdLPDzACJaMZmc+IQTFGOhbhD864Gd6qaQ7I+mvqXK+IwWhOCM2lRzRonX275TrI
	 FUAtR1IrhMVvl+D++6miNe9N/BE4BA35CtdLjOKK7IaFRR5ytFCDsucHlFLON8wgSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOWsr2Vn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6giKNEN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E305606A33E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E305606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOWsr2Vn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6giKNEN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtTro2980857
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TLvjr13IKJDJEa9JzlYzaF9C
	td9oFkXJXsX5JfawbUo=; b=OOWsr2VnYk++zL7ab+bpCiDSHWgjPYre8odEWsJj
	0D/jrVA8HnVJu6uTeKMEUgoR/SoiiXCzyExVur1XTLBu+S8/HsBzIZ2IZGJxKXjc
	3J1LAummLuql+ejpzrm0Mh3Wfu3CTQi5Cnz4tnAFsMHPrBivdIIgCX5aN4XF/X2F
	Msfgoe/fdaJiJ0VorMmqZkjXxqfZeFF/o40MhKpc+nw/EhMB5aV90OyojMTiS0fA
	wa7lPpLrNidjO/LhqX/pAKrGrcJUs3s8G5VXQn8ml08PpSHniHFhydHvfBAppix9
	nG8y8sS7EKIzgxhiYJpSKRkCjSJ4SWCJ4J9Mh+UBCoV0hQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksmakcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:16:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so734683e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420998; x=1795025798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
        b=a6giKNEN1AYUjHnB59jnC05WCcW0Sqa77IH40uWlxsVLWjFKhG8VhcRekLkACt40Ac
         5cT4QbcBQNL5ZiPLGYwoL7MTNOSgAJ6/J9R4eb1mwSdSf86cEaV4ZOvMbhiHfy+j4Cqk
         j/RNbGmqUERxlU8fnOfXnnFEinmnkWcT2qQxnsUTsXKi6NnS/7gdCNFe45g9/yzCaHW5
         XWgEEkKE1FdfemQfHQtBT7E334e68TRBy2cfMQ1A4lH2uM7Ay+9hWoFQbKGhhPAo4846
         MfE7tdnv7rZCYFdP/CK/vMWagqmgYnV6SUF/zK42YYNxjdCN9/QqNfocJrEc3sgjnnNR
         m/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420998; x=1795025798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
        b=VEDhFn8eU2E7OPazBN3kBY1WrbCG22Zu6H0zfc26XecpAhAP1GcgMU/m5aw0o2r9Jc
         Cb3hDf24wBpG6pcpHBgEyXluDD2NGYFKECQ4xZWgaSsL9oNSLoEPz8B5hGi1B8zB7JAb
         asiUq1Z5X3W631LV5PCX0ckrc5FWXyFiZB+G9d5R7l+tVOrOYIdAT9m4TOfgGLfrWtQ2
         Vf/xAe+3g+mcMEMte11E28zZePbFrXYDrDyju1h3vL6TZAEEEDAnETx9AiR9/hCSvM2u
         Cy3N+ABVLkMJPrIVaG/S6oAB4H9uGooTKZAeSvuCn9At/hRYYNrGBgZjFHX5R3q/PVGN
         Is9w==
X-Forwarded-Encrypted: i=1; AL+hErEiUokoHk2iCJmvscrEivjTlV0RWns1wEkIMUtEicDZ2JeZhVB99DnfnOa10ZFwqmhUUBEKg77Ux9RP0m37@vger.kernel.org
X-Gm-Message-State: APuU4Z9X1zhbl03IPBByUVwmqjuHGYaovrr6Dr9Pv12d/Ca+0Un7eXp4
	9hkTnth6Du/mzBtn+ahQ2ZMGrgoKsjyksf8Br+bhAzF8Xk6JH6dPcPlCuXjiQQewtwLkBfc3Iaw
	DD6ZL9jw73yyFLCiL8DseY3Taa31BbPfqd8P3pt2qecT3KSwXJFuNtqgM/PK22iV7PKqL
X-Gm-Gg: AYBFou3TiN/vxZWnqymbmax9bf8K1bNcGVbrDF44w3fcmLI9e2FOvIl7qjepQ6mGuCz
	tfRH8pEfkSZJugrPw1gMt9Nj77mkP6iYnWw5xuA/SAenFmy4lHFf+zIix/LnErbcOwyzhNoKZFa
	2ORNgteYlxzYQoxGzxsLqKCptLO5TbOBZZ/6qYH8dUcP/vcejU/+k1U+BFjx6q01CnpH63fyAQE
	vOcncdAQdwU8rPUTXQJsIysyOrUPgB3Xij4NnEfvVMmtvagOQH11DgTlzFvnlJ+kAbCe8iXjMvW
	OJzt8hs1KIgP7TOxb+dyouC9na1ci9bK8uTASAHBBjVtCjTT2KIZOlVGukMgBxx96i1VkfBSaEU
	FIVUrq7ccL6Ia1jd6Zhoi6SzeGTvJeLH7U54czu4dfxQxHd9YUo7vjb4oCKKFX+B4Yv22Y+Qi97
	DfiMYbu3k31ZE2bGKexwAPTAmo4/79Te5QVTgIPd4Kn8p7Jgw7taVGz4iJBw5KrA==
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr1196145e0c.1.1794420997987;
        Wed, 11 Nov 2026 10:16:37 -0800 (PST)
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr1196076e0c.1.1794420997470;
        Wed, 11 Nov 2026 10:16:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092053cfsm12797171fa.8.2026.11.11.10.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:16:36 -0800 (PST)
Date: Wed, 11 Nov 2026 20:16:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] dt-bindings: display/msm: Require DSI graph
 endpoint
Message-ID: <bxmfcl2naw645t643b5c5lomlruhpv73reawmxzgmzn7jvazkv@fkodaq2ga4hx>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-GUID: bnxbrVCv5dIvo6vvOnzpHHj_hJlZjFg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8q0xcvPyivU3
 NHAvIIhed4KIqL6ZaQOD2BUVYo0OAd+ascz6POl4tMKkz3TxRkWE/0S6uVzXAuT2ZMv1j0PKTA3
 trpYAUCOAoa7GtIOGkyb32xGVJdRNlEyKhMdOVXPSMxB/j5WsCqxt+/uM3rpsr3C/Kl0IJRcTpd
 1NdcfBwyxkpJsBtnesPphuZh5dxyijUyWAwpfdbJaW5nWfHU8CmNg5PskuSpFOoMCfG0tKSH5fm
 z6tZzMExLJv5ELPs9jVA+8/21V1n2YMB09j7XXlI78qkUP2C5+a/2anKDFNZtdTN9H/VvUaGDnU
 JtqmsiwO7j9w9lEUlfswa6vmtLo3i1UZ9+35wM8p6msWaaGSfLwe7G42aQMuSkRLGJDVO4TLYfT
 rX9BUrPUsv11Yc7Ls4edptyPX2cgQZhH9H+6qgF6xXBoP6Jg2W8HKTygkl2gw2q0OpgPRj4CjmI
 0GjM0yzxF0bgQrQedYg==
X-Proofpoint-ORIG-GUID: bnxbrVCv5dIvo6vvOnzpHHj_hJlZjFg3
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4b107 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lYOVpaM7r1jpJQzodxMA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX9+VX0Fl8rzot
 zL5bbOGQalbv0X1vG2sbewyOUkf0ER+NfEXPMoLTxnuZ22i+g0bsKwKFoL7ejGL06pUWV4ec1C7
 U9d1SWWTLcnSZudGMQ0/gprqzJNibfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:02PM +0100, Krzysztof Kozlowski wrote:
> Technically, DSI controllers do not need OF graphs with endpoint to the
> panel and could rely directly on their child node (when panel is the
> child of DSI).
> 
> However Linux Qualcomm MSM DRM DSI driver never implemented such
> approach and it requires a valid graph endpoint pointing to the panel.
> If it is missing, the drivers will silently accept such DTS in
> dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
> of lanes is not initialized.  The number of lanes is initialized to safe
> default only when there is a valid endpoint which is missing data-lanes.
> 
> Extend the bindings to validate existing DTS to match expected ABI.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Please apply after Qualcomm Soc takes DTS changes to next.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
