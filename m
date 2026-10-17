Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0A53A5E7D
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258246; cv=none; b=OxhO7lgZby8+izUZgi4flPRlylTKB1Htb2wGgsAF0ozsrtVH08BJmfMFgU0rko5ooW30bHyqWoqMFr1K1455N0gEScPDcS0Lbh16byF4npFwVvF31M2RBdDbDOdDwqiez2bAVONqFagcj3vkaS41AmR0gWYmD85PH97FW65yICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258246; c=relaxed/simple;
	bh=WPWzgn8BzSTLXjT9VD+9lO6sjFQsNwDPrAH6pqJv6LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9YFs4L+oJlJqPczOJK3gZ4WnAo+ucSwNJfYnlfd9cso3/HpDjOHQ+cPXJVVGhisjFE3+TBKxfO4yFIGpKcqUvgobl8VuGlw51T3S8ekJey6ylvIkL6pU+y1zLYv8yBCaaHtiU0BBxNxYHqG7wmAkOXMCVbASFvlt4GohBXXSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAe/ryk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDLqt/L8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAe/ryk8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDLqt/L8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA5iN1480569
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=; b=nAe/ryk8u5B3FWhP
	/jbFnH6FSU+jOiUiBTd4v9U7O8WAwx3cVeZl2PhWAQVpS38MayEzG2nyiWtPI8Vp
	PoWdgbaNo3l9Rt/pWLDyEKj+SUAu2Mk7vqJADZLjGOLJxYzKc5D8LLSKYrVusGZ2
	8kJ46fkuUwxU7EAkcM4KsBN+hKFVtqiZsDxZkTSkYX6GJmw48p15uEn72+JbN87w
	1yUaILTBN20xlhJ4Fx+U4BMQzv7WYjP6ZH8CmetaO0PHCrnu1fhBSN6FJAg1yyAM
	LwuMoTVZn8wfZXPb+oRZZSHS1AqF6m30Frqm/Odjf9AWy7qrfan8rQmtA0NuP0Sg
	rTEnXA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13usdwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:30:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so3429836c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792258243; x=1792863043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=;
        b=YDLqt/L8nw0wPr8PVb30pmDZGu4eJjIHho6xk13GahsvGvYbOyU070cPBaS6z/Xnhk
         fpHhrIjedF2uSMDI/uLSe+fnuXCRlYxFUM8l5mdTXzH6+tys0TDJUzB5nFEm6OtwydVu
         Skl++q0rFoUIENBTv9nvEiFKsP/nJAizkhlJJkJSnM7y41VZlKsJusGFrt/CiEDHfN6L
         xbYnQJfURjnifQh8ESLYeMZUYmu8Bfgz0+a9+pNL2SXQ6j5S5+6G0mw8wVQ3wxohEis9
         uytt0JVCbn8YyTZ3j8NHvlrNHREUf0PtRg6CHaY5BVdaCvMyxD6aYWy3O01GusHB3RBy
         /9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792258243; x=1792863043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=;
        b=WnCUNv7Xt3VFdKOre/iqLe4dgfUFltYohYgecy+Tx+5wi2oJKHkW2HS1hyssd8wr/L
         mJociNQv6HrfiZ80b0EoinIcKykITmKT8cS9W4PFAlEegyDHrIMM9GHVqVqcYmV/yVQ6
         mO5LpcoAvx8ihWGukADgSKEbkRDmuF1RP4b6AF9s5X6nmY/QyODIHwGwyflrhqVw6A9Y
         QFmTj5V7ZUG/QOGAl3Ug4Eo20FFP+WIHQMV1P1S0S6F2xj72fLwesxPHYEzcuGRfMrHD
         ZDWJzNcs3enuy2K/HAuIYTwj36MHFeal5flVkWUgu2Pzo80gfco4aLj30LME7mZ1OwKW
         3efw==
X-Gm-Message-State: AFq9FYL4zAXhcc4kdB49lKmzH3RQYOB2MnqfdKwOOnqZMWYFDfs9l9ba
	O2e9RqUzbFp+O0+c7LeU0eAT/h9I7AoHwTL+NndGju0KEVluLGiR/gpyQm9c2LrJsIB9cxyUaXc
	P1zBFEea6aKXpkHsBmgzC/Amv80aUPy46GgHN2tN0unZFUtMMxSUechrTj5ZfgvOV4sJL
X-Gm-Gg: AYBFou1U2/n18tEMvSdcPd87rwOYLl9Q8EjmYPfuGO7SiAAvc/t8/b0hC4/kO8MtvuC
	n5QFZruKY7eex5UUcoHgQoWviOGt/h5U6VUXAX6J6/btWobAMnkFi//4BGgEzDEL24iVWSCTCfA
	xj8X7O5cn7magejfCw1jnA7ghMHQl501u11+h6MuROzq+F05nnFjNTudHCdmQan6020c0DxmZOk
	3zLjS9rh1i3rGipl3m+VW9tHr2PMKpBrSmZgVUUPg9r1AEFO9+XHwHo/kioDS5vYNxya4oJOByN
	Y60BzQtlwmRM+eb2Massl5Vnj0u5PN5OnoXCXkC1Cdat0FKK890y46Nb6iUgeyba38J3XTKIHTH
	3Ez2eim0cW6NVJrQyul/5Nbn9Og==
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr4379122c88.30.1792258242822;
        Sat, 17 Oct 2026 10:30:42 -0700 (PDT)
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr4379078c88.30.1792258242242;
        Sat, 17 Oct 2026 10:30:42 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm17247527eec.10.2026.10.17.10.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:30:41 -0700 (PDT)
Message-ID: <31bec5eb-97e0-4667-ab6e-0de662f97633@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:00:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: qcom: camss: track PHY type and scale link
 frequency for C-PHY
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wZD-E9GQJBwdmNfbM24UQjM6iOBQLWAI
X-Proofpoint-ORIG-GUID: wZD-E9GQJBwdmNfbM24UQjM6iOBQLWAI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfX6wSAh/ejHFDO
 FZuEY7yfliEqOc5pX7xatRHV8EtLz3O8w7x82ABFb7GCUZKyhBjjD38ZSNJ6OUKUNwvDFYt6v/S
 xt5FygEcRpq7oIn+AcalgfG487Jm0es=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfX7C+Z2Gfqs7/K
 3H2aL/niEi/VEHpkScz38l8fFjV/7+qHt9zA8Vn1YaoF8USOxfohQvKnQ5lmfP6ECqQPbCcK/Hj
 xnq1IPnpgOmoYux7lStm9OaqRiMKbNn1TQfczMSMxaz7it00IVupbey9+/IE8lfVGs11V3TXsSD
 IfH2dH/AzMuJx/NkORP8+EoNejz9lapD/BomPlec5Kp1+tSkeGDBe8TuW3VM1qAvSKqvR8h+B+k
 LQPvT/cLNHU+I9xdLpL58xGtdQWq3YLLZeoi4OwlZb75mJD8KzDGYzCcnRPFK1zSnk4UZkjns9z
 YyC0xM6RU1xEqMJbghSF/NQ18L1HZb+ifjdQvLZgg856XGM7qRQvA6TLuw3rwpc38GfKySgiFJi
 VKcpGd3I0B6UKWe30vJQuvx2vdiJb1k7liA/YQfcNyylIhFcn2d9fUdePKBaI5xV0QzJG3OFLqi
 LuRFeoTnDZ/F46y6tQA==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad3b0c3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CCQDo4VjHF3mKuCWjr4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170069



On 17-10-2026 09:22, Anusha Arun Nandi wrote:
> Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/

This Depends-on is in the wrong series. 
The driver should not depend on the DTS.
-- 
Regards,
Nihal Kumar Gupta

