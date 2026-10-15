Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043CF509EFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057719; cv=none; b=HlbP4o1y60FrmAYwNnwytHfk3+AyJIOH3A3P5u/jSku2BfqIjMDrr42OkReLQA3XD+p3wgV5d4Zt6SHNlfOGTFY3zs41OMNKH9kMeiIrFDOMhFIZIdss6rvOD8obez5LY6j1mkZRgdDpKWQrm/vuEEX7yLFN+HLwDwVLZLWeJNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057719; c=relaxed/simple;
	bh=mu3+8mK8bt/N7Vf81iCNfZXtMLQtZd9goZa/42x+XVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPX3x0bQZSi03uHtI9tOiQ4PilkNxJ1bBbxSdH+3By57lbfCEBcL2xUnmDRCnx46XGkZd+aQQXT8lpy31bNuLGliFxn1oDpK/mtS63izcfnG4VNU2bF+s5wFXlqKBS6kGbhOCEeH5I0ttfWEuDFpIgcBSgS1cWun69l75jHR5og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYQ2LI9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPoVRQGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYQ2LI9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPoVRQGA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTl62809309
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=; b=PYQ2LI9aj27depOZ
	qeweAXNBoA1cgejsFBYuNOalTEdQi3dhHBovBh4X5s67yygNgxEewsmXMGVxJwUJ
	xknMYhgUc0U7Sl1gvwmfoSE5dAGNJJuDkn+GDtdTh7un98iVQ654iXublSoIG3Sg
	f8/PFJQdbcAqm40e55coyKkeZVOK6GRgywvAcUQXGRBcvkXlnuBLxfiHkaHOdsz1
	wmwCWbaM+/YW1xU8d9Nq/H2ax0JHCw5413mffdzYSGHYgbysfsd7RDtp7UYVhM9L
	wNHziNWZ6WJxj9qi4gJBZqjatGt/8HL8VCV/ZVmkfN3Qytu6KTQuq4NVby86xgfi
	1zT+xg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54swk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:48:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53391022d8fso11551701cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057715; x=1792662515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=DPoVRQGASgmKLY9iyJiD6cLf8bOORZjvbgnpgFn6FotCThQAW4gHm1bgoiF1q0g4iQ
         fWHTJfGDmYj3Sprs5Zw5hJGpjAeU0tWvIMpxHtqIg4VqjIL1FPkA0AeGM5rr8RZIvbtL
         i1LKQrShYhc63k+XOTe/sEtk5L6YT6ygXXhdh+DWarb5LHtbqS1y85HGSTCqTPXq5Pbi
         XLWUJ0CWM2nV3hMUB6O7P6mOE1Op3ve8WokMzI1Za1mWj/gUOsTbcc2i04m7paMcJQsU
         16CnxppvIMQYuj+KDEtgR/7w19Bnm3o/5Lj7WNzamzlZ36KSN2ak8k8YKz8mad8rDrPM
         kHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057715; x=1792662515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=VQMal10ocYb6hKz99dWoGoLcuGAQz7A4oxV7hehTuYg9EJWCXCBCA9/kxLaaKLBuSo
         sw2QZ9HCQ+stuDbrXU6mmmrfNHPniH715W9B/f+DAkYQ2pVpJqNYHRkBOgYedJZcFYf6
         KHvKxIbRZwrK6yDVw8g/LQeKl/d9IbeUI6rMGUC7LPmJzQ8KQcnIeatTzH/C99H5782w
         vpZFt06Rctv7LOCwVRdOvOwp3rr3FSEVyv7nyPOjqF0dXbZCFXSaHp/UARtBzIbu/9hO
         Im1mUGjjAQAm+78TsgGsd/LEY0WpQkynEVAc1SsPeznWCLPaHIQbkeoNjT2B6KO3G64f
         pG2A==
X-Forwarded-Encrypted: i=1; AKwUvBw3l6x/K6IlITFK37kFoOA1hPudc2GdE+pg/9cBGmJZoVr2E/47C8n1XD426PcamHf1Tyx/D1atEBpk9Wy/@vger.kernel.org
X-Gm-Message-State: AFq9FYIgDjt3UOm9Pyd6D4MrhW1QO2ZxRTgunArZy41iexa2a02PuAYg
	iXzGjRH073FjqaBygwkVmfzrCzltbWyoFkvttyY83LK+hJKphUgMOwy1fl0I0o4tlF+3NQfPJVv
	raLmIRLRYiBlKZKiHjjNB4OeeHYzhTN+nkWceFf+vaTOs+V5Ex/lEOHFS1XPcNvGoIebV
X-Gm-Gg: AYBFou38PcBXX8PoSHu6e565tlFnDfswuoRud5D/LOAjrtqXb0IXjGRab6KTREAAYwq
	7sBrfP/cp/nW0e461/jm3YZhjbsgKxxzzeRCbtzwdubGJO4+9DNEKm40foFHOOGI+UkHLTyZJRG
	83ts37xG0q/osFfF4/3QtmIeYg2wd8xufOkjVQ5LU6mkBju3Zt9ycy3KTSnO2MvD3BuXNdz+BMO
	zrb/49suLi9auSfX/G+B+6iDkmZG0WD7gx27Q8OqUPy98xP2YplgKiWktDKoy4SOvuidIwfQkzl
	kZt49jj6buT8zDGlavVfaNxErCeHEseTazgfhA0XInjuGsT9JXEuuWauchLq+e4CZXA3+56UPny
	AvcGws0SraHGBHlXgnV5Tsg==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356797901cf.0.1792057714093;
        Thu, 15 Oct 2026 02:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356797601cf.0.1792057713501;
        Thu, 15 Oct 2026 02:48:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm102601366b.70.2026.10.15.02.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:48:32 -0700 (PDT)
Message-ID: <812d0272-db2a-4dd4-8e6c-e66145af2db5@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:48:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Use DP AltMode defines
To: Sebastian Reichel <sre@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a173 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=C_hJBzH1aKR8969NbtkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX5Cjcp058udNP
 PzQhuAZlvYqQO8lVHbQOxMYgr9WoexLd5s1CZF1/LLuG65BKoBE0ZA8nkUOkI2P9V01/Z6mYM6K
 BdA744S2Dsoa0cl6mAQGCKU1ZDXLy1CqHAsLOIbSW21HDT3NFepd0qST6OYHk24bYoeDPPmphBW
 rlJT7v/jZ90hLafgrCBmMu/uUMbZrQzJuAsYOR1iJL0A03LMnr45koRlIMAHG3SHy11YXuGKupx
 OgUxw41XcAFqsjPoSDLHP7Npl068qxsZeoPH1wzxBKGyDis+N0uNeMvkHJm2F8Bs8Uno5Ln2fkb
 HSZVuYSyBEyPyQX6bDqbjcxGeVXkdlLzH8Tzo4tEAf9zcB1Y+tXrzKWwNDdDMaUy5Yot2akiPED
 3bik1W1kvqvHzDu+NPaWa7J24OZqV6yQ8ExEWR29jwxn6+/RSlu+liOJLGcz3yix808KmM9Jq4i
 RXNinGaHvOmvs1KuMww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX6LSP0C/uPuZ0
 ONHZL9qSXuJ8REe+go7QHNcmQ5KHADeKyFrp3pXIJis0yyBjG2/FloLMMSywK2hzQtZaB8jsPke
 ZCi9fGCHWRGuC5HqlbcTIuY/dGrR6lY=
X-Proofpoint-GUID: HjnEnmmGuiD-l2HaupiOcFLF_ELnfXI-
X-Proofpoint-ORIG-GUID: HjnEnmmGuiD-l2HaupiOcFLF_ELnfXI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On 10/14/26 11:31 PM, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
