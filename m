Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168203;
	b=A/KG6s+/UgmFLK6oYmGAYA9hNOPy3DKA9/cx7xUSt3CocZlRjN41UHF7vScYGAouK4zM
	 v65C73WmFoQ08YLkfZrFXNMeO6RzeF+6R8XT9bRPaN2OHkdSjjIqmaqKFSLgG7yCGmcjc
	 pWox4Q+TREPqZkNpbJ9/K90oBKiOdf6YRmzJTwcuaVs0ECa8OvqoDj1hkuza5wbD6L3+C
	 aHsQGZWUp8kHIhyBzr24AmiCZ2Fi0NM6KJnn+29Cc18NynJiFFPVXQi9u8hyJ4xV9WHe2
	 q0HlL8WAEphwKxZjcRwkS+dnkUpQHyveWeEBTx6l7FHQk2zK3nQuPMGVSCScu1tzdAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
	b=WH4k9nvCag6ZRlF2VLKrzl493ukBpZ2+UcT33fPF/xOtxD5qbREL9Ev+RnAJA2BtyK1w
	 kqOsyhPNZtgUXUL1uB5FG58sR2wYZ9kA+PjXZnKTjZ31hecqHz557RIsF8JDjgOxb57aG
	 FFzFezqUUEzCBVspCnz2BTbaXFJff2gkJKY/KdmYHTgb3SDdpWb7BINaqhHwgVZxs+sJC
	 F/70+J9ad/Fq+zbCFnApRwBdrdlcTw/BU4YgqymY0ce64JUDbuOuQsUeIYIqblPsDp5wc
	 LlFqLPswPI0167mVm6sVyI6TRW1rPinsbjaYY639YvcmFRPzCHU7b/6qAP2e+DqEkzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqeABCi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSa0AOtD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB390606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB390606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqeABCi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSa0AOtD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esMY1048775
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btKSo5BXidED8vJ9NCAxgb4J
	b5p91Creg660EJQWOVw=; b=eXqeABCiXtEP7b0ixlF+/asBaZcSBH25X1IqeNRK
	+KRqErrPys5/vR35Prm5xuHkmjwnMaqJDBdBAXEcYU1wE80QxWeOiYrgCKbJcpqF
	/ubyek/e8gRQ1w9VfE/+4XvTVk9I8EZDYoucRHoq9Kek/GvVLRM4mhLhi2wplRWC
	NuyvBGWwrAYuktAsGcfNivFf4WuWT3+rhZDSRRht9eXkcBw167p42LaxMxipVsJA
	I7OLKKHpii7G/n6PB7BAN75rU54WLod6VO82uYcetJRVzNkoxRnYnOSgnVz2Md06
	uJi41zOsnSChj54FPyxU+rKFM32J9SrSWjP0f2o+iPErNA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagv51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920ff6971a1so8804786d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168201; x=1795773001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
        b=HSa0AOtDE8yS/7BArK2n8E3v+Vw2xuYPKPiunt17PDMlaNZ7Esoxw4DXAnNayoqBCs
         lPHt1LQK97XFcK6FUKqkfo4Torima8vAjZlTrn6jXCLpwi3m3D4X5zYbwzExFZeHhEOY
         5gjfvryb1SYF2TnM+7HDjcsjkmw68sUhCgTLcQ/GPXjAIg8BY5BZWQn397Go7SMLAWqx
         F2ZFlgobhwI9MPDp8sDFc4us/i31sRuZsI0iQ0FHO5WI7IiapZhAaTOTjEN4yXaZ+Mhp
         /8ELFtGZCFPp6OhtduRafCt80j84Pq0z+QLvhmyW1s2U5J0jjCxfHwTRztvnulUnzXzz
         G5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168201; x=1795773001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
        b=vRv2jpR/fZMobdqX3N1fpY17AULha1FPIQGPybxrP16sfsIqT9rRdn5iz2zpXqMbxA
         TV8Mvk1RAaTv/S/6q5GvNyN5SeGNtF090Zih+NhNXii01LARr9aR5jEU22l+ayEMOH7m
         /Qqa4S5crEDNC2ITEDHgle3Z03E3IoNwEy4jwQdzlz/88Nk1sbaKSEDufpvtmJLhNIuk
         LjEE3cGoq7DSQxhfmVIoRNwZHC0dnb8zx+N5f7bHzfj1elG9BW1TXSiPmS6qPZ1I5I85
         idmuHgfieThbnfvfCxF4SZbpdxAbMMntxCwFa+xF3Xwg6rnHIXXeRS2S+JVzjIOEzZow
         QiwA==
X-Forwarded-Encrypted: i=1; AL+hErFvgYFlhkdQh82CQXW5ZpiY+LpZxpXdlh/J+zZTI2VKn+Qqm8iaI+bMsxy4UyuX24np0ME9kOsAQk++g58A@vger.kernel.org
X-Gm-Message-State: APuU4Z9zxZvqWlVWiiKsPd3wR8ZqZyNK3UXKSWMKTVVjygYBvmhiwiv+
	vwLInySMmXoJs7eAdSE6EWL8+EzehH6etE8iErr7nSDCXqV4qx365DclR2Z6HF/CuGC6/4YMFwr
	I81pY2apWF9jixfpU7nO7ML7kwtR31KzCR/zbwpXZjnmJmRwp1A9idvEO+xERnJFhw8Et
X-Gm-Gg: AYBFou27IpEwTAI/nUpS/oCe/s9H4ssdaj37VoenTRFCwCQprMCD1I9yQqJ2n8etEsE
	i+uDWRzZYwDOWGR2tAQGdv9OOuwpy2xxeB2w+Or9xZPlrC/jkWxg9lG50SgY4tcIM93HqyMBAQU
	E2kQPvp5AEd1GeYhOKo9OTfbUMgZGMYe2dDG6w3bv7ibRxGZYLPs0rFSVndzOsD3sU0echrfttl
	wP8GryTE4HOxdnq+LHP7+C7ed/VO4a1TfPrE4HsAYA6ZKN5Bmn4XMCX+E4vdFLQGnXP7sQyb2eI
	1PQsaIXlYQ9lhBqyMczYfXPXKu5DnSrV9BUcNdqADEsO3iEn1w29eZ4GFEy3229FFQHqTcygzNS
	D49ezDJrpHKC7r7xs634isycvEO0tPZmKFZWYIDKbisKnmvzaTY7Tl7e72oEX9kvl
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr413720185a.79.1795168200888;
        Fri, 20 Nov 2026 01:50:00 -0800 (PST)
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr413715385a.79.1795168200326;
        Fri, 20 Nov 2026 01:50:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61b8sm4189249f8f.19.2026.11.20.01.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:49:59 -0800 (PST)
Date: Fri, 20 Nov 2026 11:49:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
Message-ID: <nny5rvdlbd7dxbc57cemmebswdzbubs57h5fhwxftvcskajpor@shl26vygzqb3>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
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
In-Reply-To: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX9HHp8+ZfWvzX
 9CQg8TUpmtGEHN8StiRurPpsZsB8lsowyi+eu/WD7olDeVjRl9GSDlztbQbVp78W6JXPbbOlfs7
 RJm3hj/xmcRRCAF8E+1ZcOOMAWynd3tb3lHu5XYPJsU0LXEHujoP0MVVqC4+a7UbZPoIqtGW0h0
 P8YjVdhLRH4fxGUZYeitO0+kdezyDIoBc2o7Eo7XnGA+cGAQLZAQgI/fCqcPueFkcVegj+lQZ7I
 fDxKFdPSD6Maua3YfotaMGg5ykOafmQuxUGtfgPoZ32Qw4Vr23YZ1km6F0IcvKZmiaRlwMnCZiE
 wd50DO5DcgQx1USTt67qUZEVK8VS30TOiOH+5UDk93BLOn62yiTdX1HyiMpeNcOk/er2tKyrpNr
 18dzfEbWBZSo9XrQrWBuRouBOtItggArZUjjLpowtjgGHH+S0ZERzYu7vN/dKrgcRW586BTgceT
 pU2kWqIuyaDZ9trWtVQ==
X-Proofpoint-ORIG-GUID: SK2xV0EGyhgCh1wJv7HFeFQAIinbJoMa
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0017ca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gzqzoBdNbbgndB324-sA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: SK2xV0EGyhgCh1wJv7HFeFQAIinbJoMa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX+l2Bw/n5MRKJ
 cwF5zEj/e1t+7Pq3ZSmMIZUNqhnxCML25RwzyoA52SHRYn1PNVstCi7omBESYW6EW9wadhZqfZo
 go7zAyrZgW1GzhROF9zWtZb4fpGL6ic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 18:38:30, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
