Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824043BB671
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221821; cv=none; b=Y7G6lkhd7brdn0G1yblb9h0ja4cIRDKIqefyB3Cu9Rd9i0kYivF2QGBFPqM5RAisTbgNJhh8NKwGx94JQlW7Q/1C6d8q+5c63N+DJx6yoLg7UXPg8SvCbqY4SKZrmyqEpcTIbV3Jb+VWkqVCs6Gjzak06lJ29dBWNWc5wZE/wzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221821; c=relaxed/simple;
	bh=PWLPimOLxeJKoV3EcFGwk368jnyiHugBx5veMASyBH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTe6sNf0h3laiaKOfu7HrohtS+JdUCocJkGQByhhfGTpEYS/WN3qUYr/bcXaitp9PmpYswFFUlEd2SEQ2Bp5BbwLsiB3AML/6AlFwc4NyAEcIfAmh8N64YrkwyURyq9OasYn6+B5NZi0xHbjBC6oSWgFg9yMA1OxKPm10WJi6W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nydox8Tn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdSAG8ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nydox8Tn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdSAG8ok"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K9JJ432927299
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=; b=Nydox8Tnvj4bTLwQ
	d3XtbcWlzS38o93yWF0Ifa7IzXRMOM1w/EYlbwRB9edW2QZh9zNePaFVVqy1r/89
	R+Ue9xjLLpg9pM8MGO9YTDYgx7ylSkWAkD4KUrBZQ2rLgIgS2AwV8+v2mfs9I6zh
	OgdzI5B8902BiPN8QgapWj+CiJdhNUR7IzpOSlQshNorK8Tn7e+s2mPE5ytOFAHc
	0Z35R1cNY3mmJWCKhMeq8MsdZs6vR7HwaIvBrtVnRI2aXt1z0LAki5HGHUGTDjRr
	203qdZV7NjaeA/ydYxgTdHiPdRmk6ulP5sIFUsNWBeqla4hggTbdWilwu1INy2du
	vWsDJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk09ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so4166521cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221817; x=1787826617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=;
        b=kdSAG8okmQc+FcQdSDO7aeyXnABw/U1rwjKza7BtELYo+nxBbGIsUcWHuOFTk7ysBD
         e5vE2SzU250iZvAxd9f53UbqKHNRbiI0eijHok/wpfQvcBudrfI9AV0aUFGjCR/0jD3t
         oi4IjKGyktL87lPMzufbz9eFnz0lBRDwrSmU9tc9yzzV/eGIWZCGSbf/cmyxCkKKIH5w
         XV2mA2xAeM1mnEv+NZA2AF1ttqHPU8Og1s1pNsT3iD8s22DXF/+o2r04PHw9hehu7reP
         a9ndiLiQf8J9pt5td7cTdKCfltdNkHj7W9F+6TU9LRuzTOEjkcrmHtoUgSDpzGynw3Fh
         8IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221817; x=1787826617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=;
        b=OdjYh1Ty/7LbP9OMNRZrXs7bAiMXMNzjUytqcF7cBWEP6ht9lvXqxrluIqjVt9126j
         u2KLX5oC8A3m4JBHiAPb2hIrTZ3iyBcYHe7S/gB6zBfVydjnMGriQYnZ7mJqfiv6pmOr
         Xc1bpkZJyCL3g9FAb/GCAuCcoR/jxR/kzCmGNy98OTQx6eUkANhkDar4TFtoknDJHp4c
         s/ZcAiEKyjZkzdQqR4kZm5NEvyHkfYu0fQEumDWBWYZDidbWISBIh2Q8uhTxk/JihA44
         HzlFVAq+poLPKOQxO4sYXUjP+6hJMClItdWFcx4Hkmvb8/pegj/DJZ7zHK/VDhGefNaG
         jwkA==
X-Gm-Message-State: AOJu0YxDxNuG0tGD5ISyGTquL5nOi1GPRRvlku/781uL/L3Ea1yY/aRr
	lh57ON/O740dUWZBS+mDF9/R3J3iXXjaKQZCOYTOG76P2f+VARxX0ZyH7NHwN6/nQfJz8QJXCkr
	4NY4qkGxLVL7NoagiD0mgJ0YZd5WOA/kPhv5BWGlGtGNXDstlJ4e+ImxmsmGvPDvSlAiSVwK5F9
	nT
X-Gm-Gg: AR+sD1348HH35EVFzsYFZRRab/CYhi9OQoj3JkrGnM9Vh/b9DSOUkK0WQzQgimEZ1s/
	0npHqIhkxYaP6sHNX1RsgZ5UL5Rx5PjYW1y0Z1+vji0eLA1IqZ0Ckxi54fZHTwlTtHLWUVihYKP
	PZFUJgL9HjANzmopKmaZEZcTkZ1JwlGg6xpxo3lzPYVpRgjSaXoKqGgbB6A63k0GeNeM0q/v3Ud
	kbHBe34Nhd68dGTOcy94E8nExyjcw4Xd+KGOVJiZh5zW9oMhoPqDM6b4DvF3mOSGnOdzdwexPWV
	vwsf4bgIVQV70Wtm5R4PdFSqVrFY7Avj7R+AS0JzjJUchU9gtoaFORiOtcAch04qFEK3Gi2TR+/
	+nmlUsJssl7S0RebhH3mdy8xk
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr87004311cf.5.1787221816712;
        Thu, 20 Aug 2026 03:30:16 -0700 (PDT)
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr87003601cf.5.1787221816079;
        Thu, 20 Aug 2026 03:30:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b0b00esm52770466b.23.2026.08.20.03.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:15 -0700 (PDT)
Message-ID: <1134bbca-9c3b-4e07-975c-21aa5c49fac8@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] clk: qcom: gcc-kaanapali: Tie the CX power
 domain to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bb5gbLZKrtcGVkYqc-iXVbZxgatPDP2w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX35cHMEvSXsHZ
 ke0SJEzBh2JbmMtgog7kCXIskYgmam4zLQCChUj9YG/n+7sf5QwBYY+vJAQfVFmU2LV9w2JXSFM
 ZlNFkj3P1eMnv/QBSbKPeBOwkGYyJxE=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86d739 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tWEGOuoi_ilLz9bYf_QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXzQdARyZWNZ3X
 eXcEDYvzq0TqonBXS9vTPv7VeKtAlKzKSjIzaGAEw0U2U8C9InqYpb/mvBpatTAZnyvqgVKGzSr
 LWZYU06CWD7KwZcH+b8cj8tk8iVU15LZOj+NSm0MARz9wX+uYIf/oIMA3YjKxctmkF9NYP8IzC8
 gkTvU3BOPG2GQcYZdIvq/GBP62+3JKukj+oBQuljCNpZoJDuaYXaYTm/eSaBz9u8qXhovMm5lNN
 YTxmDp2IORc7MyjGeJ8cSgFGNUHCZbd3MKPl3PFZIKnyzrTr7JwaRUfUGkWv6T07wQDUBQnvls+
 px28DCgCP8481B49hfBaNS40gu4kpdOEVZkPfWgKW7e9YLveMrqoFtIrf/FFIVVumm8Z3tgy/lk
 9qF70ymUeSh3G22Aw3yu3CGseTKl52VLNtfoSKw7aqEcqe8AfMFHGHVSbvibqGUbk++csCFoLv0
 ONzKFKEqR54+2A0rQYA==
X-Proofpoint-ORIG-GUID: bb5gbLZKrtcGVkYqc-iXVbZxgatPDP2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
