Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5F8495534
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193693; cv=none; b=il09QwYLyeFtOPxHQs8Z3LcIDWLjHUSOR5TITLFa9DuvLjORlmTuOR48cOFrF/eAmzXS4yPrfUk5SMoOcyA3aaQ/U60sKaKv8RDC1QGnEDMXuoEGrE99hh3mhfMHKx7X2vHzRworELf2PbFByX5270mkxUs/fjZNgzqL0M445Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193693; c=relaxed/simple;
	bh=zkZGdVRwOoNfXfRx2NY81vLd+sAQrNPf20jgzNFCH8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDOcZBBNRwDzCecrK/BmjF2P+MOiyzZmmCnfh7HiBBJ7IT3rrj54UFg8Pqr1aDubUmh6hI4apEW41xkYJT7V7BBnaXTvaB7DMCrkNwtYjI5PnhqZs7gsed0K+kmKFY2PTNows7YN5ahyab/5PdzZ2j4aRqQRrE0aQZ3x7zz54EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aufi+QbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYRDgyRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aufi+QbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYRDgyRp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq1LM2900861
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=; b=Aufi+QbFrcZ1EklI
	yP+e1axCE2oid1XNbvldEVA/YAZYMEPNqSMQCmiuBPHNo99GhWe4ZpJZyyGGJR/T
	6M51b+JIXS4f1sxyVMLiysgm8dbZDxY5LfUL1SqsKUvr9zKgXJTHWFIaGcP9v9C/
	VzdACCIxboE/CqkPlNeJ+INS57zyOwnInsnqxo+t31mGviuvf3gMAM2kf8T7MlNi
	Zd7gPd4g8FtFxoOFm5bFnpcJqQH5NQlSxQnvd29nEQl9ta5yRxB49eKWEofsT7j3
	LBHJ5PebDflFyXAEtIx2N/h3UMVlTkgLoi6cW+oKyPrmOs4koP7Cc7DOPisM158f
	lx21wQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vahuc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:28:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390890ae83so97321585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193691; x=1788798491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=;
        b=EYRDgyRpw+XKTAxYCziip5o19BOHvWyNIFNbS8IQ6bW10FzMm2Wkh2RMQ6bgN8tOMK
         BD/8hmvDNfjrU0HYfw1jnpwPDpEnh8szok4cUoe/hANqONyTfJMEziznfA2LEgA8XRMr
         Um87ArdZyG4YodOQWldYmQ1TvALnRL1lZM1qJQRHiK/jh/1FMmwAoxWXsuYxbhny1rr8
         hVmuMf2hdnnfAJNgsJrewnJAzm3HXlU9xUktHOLyeB2HMO7UbzrUChkTqM/pJ07i5syj
         9jNuLSEekKaTekmGrGp/NuetYXFokRdmHMTyTIr9Un+bhi4jmftL2Faejpv6HNcrkUNP
         c9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193691; x=1788798491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=;
        b=EaDYX2gSEk8g+IqdREP6/uxsW2f/pEG0K02jAyqCjEB/zsNboOtls4bGt1Q+TZrDHI
         9PhKAAl9EICerFu4aW3IpGuKrGthMzTsZttA4cMJEAIpRCqRpOmlSPXz63YRJy03NI7P
         +JqcH6KMmZvjca4HFjAzNA3By8uGBgfOyxO6W9HoV5D/aRgurKcaKWPjK8bsJ+Wn5O1/
         ClhpYei7S4Nyy6X5gl/fK2I+xcHhUCFcuLdVcAWVWB/AYbarX2BKLnDSdLPsI2PFav1k
         ccLrDo5vhnm6WMkdmbmB/o+V/0yQ0sGbsjvwkX399QrA+NPkjQE7jQ7Oo9S5OPN9w46G
         zVDw==
X-Gm-Message-State: AFuF++moUVu5U2nCE/g3NOZip44Ph6AulrPS7uP5h9hjtgLF4YjvH6eq
	e9mX6FqCCx3/kpROgU5J6bSI+WzXvHfLK6Xc1jYpfdu7gFZGk9YvacmZQwHiJ3losXciesEfk7E
	ORc8KsR7R/PFW3JqPvgw4NR3WNggk6YnOkawZNG4ZlI8A9lutx+fYKFDQjvJ9BaGUvJi8
X-Gm-Gg: AR+sD10kKfKBpRaCeqxI2l4mM5FHg2Ne0RIZ2uBhrtALPmSmTIVi/4FasiE0JuyXCML
	45euMl54xv9MuAHAtwz5T9TMk0ET/UMAjrFNclIkwtWRkPjJqfaer5GV6LGnJ85qAhffwm2ZjW+
	sGyMJyyaSyTifzozBc7aHvFTFTaN8wHxOlBw2yO3s+iY+L066D6cmhHHb+05n/K3gVYR4IC19P2
	rbJwSFIxBDwR7/EdJ67jJoDz7aaZ3kzI44bMiFbwNrKXlTwuqlpbWZOubYI30Q7hJugX7FHVLAx
	bvSZjK2h2x/dYUQcGSuuh0yCri4QGPGW6tz/oKs3UaJ7ENM9TV59AgCBydjR9VQBrcOn6GeCezk
	2Us6WzdqKcuV6cvTuKlFbOw==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1054425285a.4.1788193690749;
        Mon, 31 Aug 2026 09:28:10 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1054405585a.4.1788193688823;
        Mon, 31 Aug 2026 09:28:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b5a4esm464039466b.32.2026.08.31.09.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:28:08 -0700 (PDT)
Message-ID: <563e9749-5558-4ccb-9b1d-0d3ec6a80ed6@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:28:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 03/12] drm/msm/dsi: Fix indentation of if
 block in dsi_mgr_bridge_mode_valid()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX60rE27jusSoC
 grRfBDNEWy5c40k/dVmbqkA/8IjPqLcAyEJrSWe3WduzjVYbxQZZGaTweJ/osIHAVN6ry5RS8SE
 6YmEYbzg+Ed/EDl8MkxnxSBvFFRP2+6QeIuqSugA80IB7lXx8xbRHkvjgugZbVqcf6l1klMfSYT
 iBs+p1wt8c2vWhB5IxOwaFcrcqzfG7onXQLNApFUhspXQ+qCs3HAHxpJxWh2IAMCIpDa7Gwha5u
 WYfmrwWuZJcwyipOoQDNk+rgIiP49csFwwdyqNHjiboecjreau6gOlWVRjCY70AY4M4s2f7IxKg
 v9r8OPeNJ8dDP+W8E2Dnyz01a+BYosgF3RmTZ4RM+Lx+DJg+m5eLCekNPScydJK9iPV10nNvnBU
 4SwGd2rE7VVLjtR5IcqILxE0x7Zd/Fu8qa0sIn8I41NtM1tKCz3iC+9+0s0nWLgXh/7MQWcd4aG
 Bid3FCsYt4nZAspRW8g==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a95ab9b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oMov3bMtrqd5QQYwA5wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfXw8ewX/Nz9oNO
 sVAbB5FU4XFzRo/GKTzIk6/c3VOvoDY4moj0dVkuLTOEU6m0v3aYVPKU7uBTAqYMJqezCYqsv5+
 msGMCFpI/G2T5F0CUr7VX+b3Hqiyjmk=
X-Proofpoint-GUID: _aEHHsTlM-rY_vktil2wHJnHTxT3BPtK
X-Proofpoint-ORIG-GUID: _aEHHsTlM-rY_vktil2wHJnHTxT3BPtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> Correct confusing indentation within else {} block in
> dsi_mgr_bridge_mode_valid().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
