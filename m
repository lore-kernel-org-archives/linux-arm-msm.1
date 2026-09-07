Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44D411693
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770963; cv=none; b=Gj7iDS1aTN/AS069tuMsamw710Fra0xxzWgjNnx3clp15hQj5RG4/jjS6jQrtyeT8F9mqTFoGwuXleUtwt1p+ZH7ml8cnjGiFQsIMqTQJVKBxmKDGpSmx84/e3ZmsE+rfIKtbw+62Mf1i69Z4p0bJmjFDPbjzofWU2bxqCtAKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770963; c=relaxed/simple;
	bh=OrSdW0cwhgNd4LjbyiMrxcWjoLDm5czxoDQHAXez5Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KC9bdCkNR8TPRkbgn2HTOOnEMT8joUDme0AnXQ73nfNoQuarpuyA1dHtvVzZBBCPs/2251LoBpj1dKOgLruEF81nZcvFO9vMuKfu7qkm2VS0Cyc67FqRmJKBd1Z+3LbdL3NCvGK03W57WnBhUojmKwXQOnW3jM/egkm6Ecz9StI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHb//XwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCwrWnvn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHb//XwM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCwrWnvn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Li53363500
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXTzOwyzZKv0PbSpGLHgvDcuBXWW0EY8OpiOEjhnqC8=; b=BHb//XwMAO8UsV/8
	IYn1mz8wsaUlcJrTcOBpyMdxcGrocww8V0hQN1njhOE37Qx4JdGsiyyRJKVwV09a
	6/IqSTrH8bTgJrhN4BFHetcG7EhWbr87CTKbrkKn11fCK+wB/MHsPHAJNOiDcSFq
	O/aEEg1ZcCpMR5yrdIOUnPWaA7P/NfioCcCeGIUhEc42BgJf0sSkv1Wf85JpKVSS
	A2QGkgGKStD11uLesxZ04E7pHLodxHXAzE4sKaeXpl08fhwyieTirJh3cfYzios0
	8bAdOheWqv/utnA5MKTEbtJfGwDBbkLJ16l65f6Mp7+WmV0yQZzky4Dxaio064MR
	dVu4ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj14f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:49:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso7260656d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770960; x=1789375760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BXTzOwyzZKv0PbSpGLHgvDcuBXWW0EY8OpiOEjhnqC8=;
        b=LCwrWnvnkpKe0K72QYI5zeHZ/YpuY5y/FF/Nx8iIYJzMcpgdXA3YJdiq2maTEn7e1D
         Or8imGdflATBCEOLsz5Ls8QfjWEYS/e9KyHK50t0YWZTc1vgSZ9shdaJwZYKiIzeqjt5
         pwKzij6TtsBkIFatp+qEWhh5yg5DV1t+t8QSI911KDUOdKJ3Q+N462fxeiZj1is/mSUJ
         //NR/upLUfMiAtHQkhrDuaedCQ++luLZH+Eamd+vT0JtD+2ZTtO8j8ePdiKiqEZjPChH
         5y4fw46YUZS3b5IL1rkKHiCd8nkEIVD11joQitO59xoPUym0NP2SjhY4vHU5TqqyTNWX
         8wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770960; x=1789375760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXTzOwyzZKv0PbSpGLHgvDcuBXWW0EY8OpiOEjhnqC8=;
        b=Ig9JVpN8n9YxMVMRpz3gAY5D7fVLU4CHBPjSEDVBhlXpsbkcQ1haVCbtLNTnT4dSdc
         M2wrTP5xQE6bKWggrcBQtImQ0oRsYAZol70/lPmaBRjJNpQgQQzOzdjtj8w6n73GCyGR
         9Aphtb6qvbjkvUG99szJ0GA+TaMRqF6/Qavh2Tiqp/UDRc0zKQkxUW8tMaqs5Xo4SFPZ
         eaBXknVt7RGTYj4Qy6wqO8eWls+IkgMS07dwr0elD9bl6wMfbS4yNJjQdg/mhLsA7YtP
         noE4K14uNAITG1sl/MNJE5sZoilA+HGjfTcdqKYD7gfXrcIgLI9A6T9Qu+zQWXDhMAwg
         lBow==
X-Gm-Message-State: AFuF++kULNYFE1YAVmYjX+6hF39nldI6bqHPNlf76c7kRTXSL/nxR4MV
	a4+fPVoD42YS0JWnaM9Rb9GvFgwJ9agavLcbIK2CH6BsCaCmBF2I2urZfRSPw4JFIeon9G6clgW
	sXy9YnVOKf3F+pTBColeGOKlsDyyGCbSg8RmpuvftrJOT8NWh/UJsAeaoUNdo0oVHKzgC
X-Gm-Gg: AYBFou2c4irsRAd+0V4C7LNKiUPeABY83OelFs8+05HG2oATNTB47zu8wLuGM7bYm7t
	+BDUkD8+2PynDiGPKo6drhl9c7INS3f+fq0j1y0UC/Jv3WHY8w/i8cvqA4fpTau5mFXKmOup9gc
	cnyMjwdKHtBgpXcnIp0FGBT2aCiKrCiKx0WL9Lq51KnkunJSVinpa8iKKuvt5bIpcvC2BX1vawM
	xDz7AJ3Y7wd7ZxGf3gli6SgigkhCGPfXdndqxllg2+yDOEJRNtSYeWdipZ0WyWxOny4kdC4ccYN
	54eY0lciW8t6C6pR6gvfKQkdvFd0+QTClwb/TkYWuNfhzp0MvH+947lY26vLkNZxTNlVzsLwm6X
	EYtXllu9iGedNHIlR6eIhEA==
X-Received: by 2002:a05:620a:218f:b0:939:9d7d:1928 with SMTP id af79cd13be357-9399d7d19b2mr545614585a.3.1788770960477;
        Mon, 07 Sep 2026 01:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:218f:b0:939:9d7d:1928 with SMTP id af79cd13be357-9399d7d19b2mr545612685a.3.1788770960022;
        Mon, 07 Sep 2026 01:49:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca88fsm270502966b.17.2026.09.07.01.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:49:19 -0700 (PDT)
Message-ID: <ce951267-5872-439a-96ab-93d45162d498@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:49:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX9gQXVZQyGw0R
 WIzzzxzGq3zj0FieDZLIehGzNKYHs6RKfk7/RBshTQPKpdpcnhtswJlN7UsbfGJz31m5Njv2VG0
 QmCYlPu+zXRAtIb18MoIDzGGZPj38phY2TGLKXOe9b1iGv9Cdp7RMRzanFckGIxMoaXHxQqL4th
 VQZ23NzlI4GjOZYOIv41BsTPlCTWL30C9fnpDAowA5rrU/CAq+W7WVSpGH+ays7WRQ0PbsWCkao
 uw/OzYz4yDncyerqYkVt8IfYwcipFK9AjAm7uQfcvpa0gmLpJmfvVjhRGhpnvUc5VLyzYeQPuzH
 7AuqXV+t4PFVwZEcePbjqR4/A3kh88vVaJJlV+1irGp1mi/3PfOMBxnoy87bDeL7/CFF1O+iFM/
 /cbqoWbrKaXky9+mVDgTAWc56906pw5rRIv3YBnzICaseBuFM1cQ6x33jz5lDMPAq5OG0TEs14O
 bo+cu1Q+lFcKbVv4hGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX3cv08LYtmfTS
 oyr1vRxZRGhBHxgbd2J589KPDKckyXR4HksGPsx2cTKMwpsMl8E5S46VwY0WJ185vHthD0ePih5
 YhzrmExjvaXmy5hsMKUga0fXqY0+TLk=
X-Proofpoint-ORIG-GUID: Ob0cRIbUFLN8PLUIv8cTphM1DiEPhb5u
X-Proofpoint-GUID: Ob0cRIbUFLN8PLUIv8cTphM1DiEPhb5u
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e7a91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=xFBEpEO1I9XzTPArvIcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070095

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add the Purwa SKU of the Lenovo IdeaCentre Mini 01Q8X10. The chassis is
> the common x1-lenovo-ideacentre-mini-01q8x10DTSI; this file supplies the
> Purwa SoC include, firmware paths, and the PMC8380_6 nodes that are
> absent on this board.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
