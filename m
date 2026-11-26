Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702466;
	b=UlBQ9BX3SGZC5EI6Zs5UyFzhMp0/XWh9U+heR90Ht2gZjrVSEmqmQB0gYMWVGcoLzkJ/
	 R9gYy1UMdnRC73AUh2KZRldAHIjakmziqccHL3TmkhrYebXCuyhjWA3q7kcCSwg2UjXRR
	 IvwaGTbSoDOpQMXFlxbWu++9OfoRfUVJQ77mizxmUm32rtAAumVxvgRG37H+kK3p+Wps0
	 FnafXdbAwT/j5o6MACmkMiN/gdSf2KyeDJhEOmp5k9pSMhP79K3hUu7uoUwpbvSlje9tU
	 zVLP2KilC9KMYBFTMXEcgvZKsY4mjRnd+5qY+MGqsvZujS/3AitqHJNqtOiu453YRPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=;
	b=m0f0n3s276Pca/joNBaYYGStF0yia3k+Ud74TWMjLGbOQMKZXyjycjReEIWslKiBNbvW
	 Ql/KeMjKTvP85aKixiswP3AM/fVWdzKOoLbUGyoRFBzHYroYZMfCXTffLbevVIqpbu27J
	 pIliFtqCCc6tkk27QSqqj8qjODMtq9Ji2KC8iQBBp1Yp6sAVGPSxLDs9JLb4yzjGSYAmm
	 T3jO/QxSXjDmdoss5IebCNelgm0Mrgx8kcBXsvzqXoK7LNyk+O9r3IGgo30clA7QiKXNy
	 eESDaeKrMiW4f/XVY9L8zEswoj3O2igmbiEIXAVLybHNFjaD2iMTn4KpAQX+p7KQyVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfhgYxiJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBFzkuXJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450F606A68F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D450F606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfhgYxiJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBFzkuXJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNl33893637
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=; b=LfhgYxiJFNqGdxdX
	YorrbJ7nybNBDZlQY+/KS1HZHhqV+XjewdU66K3GK7aLZDJS4ts4Dk8TIX2FG2Q8
	c2KLPfa0jEyJwcM6zzNbvsv0GZc5ECxqwENoUkpkI1TUH2YgNEomsPqymOB7Yg+l
	ZSl6x5o0wG5BA/JdR2plXDtd5CYZP6/GmVfCmX+fYrKQGUIrUxQB7QstGyRxJTfO
	yCWCjbftmB8rHkcU90FwBY6Hme1KyCDozsDPw0dhlvrK3nSeRUaQkhhlFJHfLD8L
	iM/7A6TZAM9hqC0rY3bQamwS/3kuqZ1hH2XxDlHJLmfNg/B+5JHJJsNobdDdEBcu
	Gi9Lnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm8153m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:14:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so1183031185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702464; x=1796307264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=;
        b=TBFzkuXJvtNfF7dIK0vyxU7GCWP8JPXJ0mfptZKaCmio4NDsXEwP6vS94QsHtHK+RH
         FhPcMvfj7sHrU5RoSr8LOHY3L+NDiqX7mlXBumBF5amHyfKJYNXGDeKWs8eE2y/PvVp0
         1JWSF3pmqZ+8G2QdyXmYBsJAzH4Ew29m0kB6Z/nMYVXfucNs0clMM09dqyIFLCfP6QLq
         MRko0LN38OgSur+vVSsIEBXqZWPMf9zH5LOKFml04oYeYuVM/anbcDEZzfQfyqhC3Upx
         kTOiNOrwwghwh/ntQj3U//y0GP4/3a+1RsTa9hb74tSfSfM7F74zdp4avgkwgSVNgIHg
         V2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702464; x=1796307264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87hjoCxbI3i24WxH3qXk+wmGfek/11p5lfJRiQDbYN4=;
        b=fndzaBmkhSr2Hcqxet7gmBrsWrlF7igA8e61upe8L+7Zx/F7IzlBp5b3fymsQWlJRJ
         igDEe5+0ivB7lGBGldCwA8xEtl7xxhuabCuXWu7y8bXfHN/lDaDx/WbQH4PkRVCq/ElW
         1DOvWhBLvGhYTX+KF99LY46Kk+ngT55aLaVVzUIyKCC0NfByxohmfyc5vLMzmE8CXME+
         JuPcPc02hfaEU7DCWxwGxY42Y2oB0vO2NQYGWCciCbeLjFXzV9oHu1GOdu2D/pKZIO1i
         phiUuLl8O6ae4JPlQb9efKeDTrr8ZuGocmOFyvgRGVb87AP75/FtDhU45wk3Kup1LLN0
         L8Rw==
X-Forwarded-Encrypted: i=1; AL+hErHlBrV2TTvK5QUaL6cQGnDxhHYQLmIrzr0fvPGDXit7zhVX07sGxjFyi8GZAzWMFiOIQe2JmJ3n5cafSBSH@vger.kernel.org
X-Gm-Message-State: APuU4Z9/dIt6MGKOZTgGUHvg/ivwNVa+nSBl2fgcwSy1NiH02NFXLhqL
	N1zaj4wfuiEgfpwPhjj+5o4SJVWkB7didNhD18pU/o5C1iseEwF5P8ne07JHHmqb1OSFX8hXmLF
	GTd+ONjVWHrqGIexuaIvjvW2ZCI3hpMp38OfyjZ7/XX1bOLzUP4ktBGS9LlSPt2Jh3y6CLmwvE2
	sO
X-Gm-Gg: AZFdTZeLfYTNdsik97RFaVoVywOoruiqfANIOcLcRuKpv63sQNltTTU1cn9DPwa1igD
	tUOqycefMaTOgZHvWf4EOGa16BLhWe8UYzDxYgpFmCCtDOmzCA+bATbdFU697J+cMfnOB9eGsjQ
	+eMDiS3vZcUZGGgLLCC/G07vWLalKh7tmaeA7QNBeBAdu8NptjwjKIchKRcczuorubZPNAY+4F9
	RSjlKPkii69qm3+s+hmpeTain9QYDlZNwg5ahCEmGHuDGTLTBxhqiOggCuysv6TRugIsJLOnd1V
	PH2oLOrut+E169Vr13YZ5Tv3iBc7hr1dG70qsFdnZ4XCByjt1AT8Y04k/IqLZmVbxEFsFfwOypQ
	bUmDnKIKBnspWKvDu7+hv0EiRUBq0wqA6p4sz8fsVjXlQkGi+nhn9S/uXkpI5UveFyl3C7FZyAH
	SZi7T6IHHUCSEoy84sExSxAxshdXlDMV96y8a27J+9/6NPR8N7BbRyTspiwSfYWw==
X-Received: by 2002:a05:620a:838e:b0:949:2fca:4a82 with SMTP id af79cd13be357-949b3618329mr3713803085a.32.1795702464038;
        Thu, 26 Nov 2026 06:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:838e:b0:949:2fca:4a82 with SMTP id af79cd13be357-949b3618329mr3713797285a.32.1795702463576;
        Thu, 26 Nov 2026 06:14:23 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm18305812f8f.12.2026.11.26.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:14:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/4] pinctrl: qcom: Unify KConfig choices between clk, pinctrl and interconnect
Date: Thu, 26 Nov 2026 15:14:20 +0100
Message-ID: <179570245889.22980.13720050976779642192.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AfjEXeB8ZOD99RY3UNfV8e1fzpUsHyfG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXyvICTjtzjyM9
 oIJg6HZNd9GZwBV2kmXzdqafznbwMP1ucUl91kHTJTcehBz9MmgijRYgFf0HgcCwtv2n8bowoV/
 j50PVrCljXKprDohkY2KoWve3Y7AMHs=
X-Proofpoint-GUID: AfjEXeB8ZOD99RY3UNfV8e1fzpUsHyfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX932F5pjoN30Z
 wFHzyC7xqGxtO2e14UJs9E/ql6IFINtFapFJbstZOC1uN53wr54GN8fZx15A2/iBkMc6G9JRIiM
 Jlm+UgycCDM9RCZZo8o1heRgLpVdGy/SgkVLQOe5aCKBx0onqYzHfGa1Zetd5Mn4qtUTcHlfpa/
 Pw8+tRBOS1ofXoQt9Ks0Ag0kRYyQirrICaPaQUsICO8SCWf1CIkFx96/3W0608mr88sj3eLTpDB
 JCy4pIsg7lItYDJKU2WtKcziM6qZrvK0tQjttFpCG3mGEFEQ4jKu0I/tPxcQUVamPQoEqJ8hFj7
 tRKBkibdSJl/+xXL4vr8S8ZpC3OrcLMfhjABJXq3X6lUrsl+jM58MhNM0+OecmGlUTmn0R0mwYo
 0vJMJMOo+7UoLOz2P90Fp5xUHw9f2TaDudVxrHkz7ZHmXgU3U5HZcLTPPVHmgAQZnYeReCVqPlh
 iRJaxST6lN52G/sbz1A==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b083ec0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=okmazTnOSgZu4-ssoSwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Mon, 23 Nov 2026 08:44:45 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #3: Do not touch MSM8996, because it should stay arm64 only (see
>   clock patchset)
> - Link to v1: https://patch.msgid.link/20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com
> 
> Recent commits adding defaults to clock, pinctrl and interconnect
> drivers left a options inconsistent between them, e.g. SDX65 clock
> driver not enabled by default but its pin controller enabled. This
> should be a consistent choice - we want by default all critical drivers
> enabled.
> 
> [...]

Applied, thanks!

[1/4] pinctrl: qcom: Consistently restrict MSM8917 to ARM64
      https://git.kernel.org/brgl/c/272820c2cedff7102e482273ba6b717c25cc4a22
[2/4] pinctrl: qcom: Enable by default MSM8917 and SAR2130P
      https://git.kernel.org/brgl/c/b7394b0aa8c7ddcf72d16770438b1e7890507c3d
[3/4] pinctrl: qcom: Consistently handle IPQ5018, MSM8953 and others
      https://git.kernel.org/brgl/c/67bb200fb9ae8629cd79851ae4410267865df136
[4/4] pinctrl: qcom: Correct indentation
      https://git.kernel.org/brgl/c/d1e44b75cd10eead6750f929e3cf68febab8586a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
