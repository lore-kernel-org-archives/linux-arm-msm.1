Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3845562A
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992210; cv=none; b=A6MimBNPi5g6YQ12jD364lvVTKvIjx9CuWnDMdFEun8fSstsh4lMWjx3yZnBx76ugzb3IV8GXmvajYY2+JtMoyvrmq82BS9GDr2wIa673cohSFDwhYeUZcYu18v4tMOiwpohXq5Tg8SKwulBhDh2WY0G2sNfbK3JQhglNSf6Hyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992210; c=relaxed/simple;
	bh=scRw+GVm6s7wVCc9nPzG2SgvvrPpNiJqmfTKziigzDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWE8vizW5Rt58agxI48MCQNUYM1KWebG+0bWnZfiqJxskD/jYMpf+MsB52WvL5O1NO3yYTlSpD2NKkCDdYedVskwnf/deX5oYlbhfdpY2T1wEef/PUDvMfIUsqhahhWv07rASN6+9CaI72nwxnyNp8baKWIxvEk8vgF2LBlmp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGkLbO9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKFxn0dZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGkLbO9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKFxn0dZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeSDa1564800
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LuUiIezO2nuT5fNMnrZdAnpP
	J1LY+LflVe+Qi9hbePE=; b=OGkLbO9gyndnffTpRHHgHLpbV5cjhfg+nKcTfTa+
	iQ5TftiIuo05x8opyACoMOENJxGBZ/3Xk88+FzDvmm5oK8oui4RXMS6xxGDx37Dz
	sUSufxNELrGaLW9WSwkuS9TDsT390CgC+l5qp0uE8z1BOamsnqPO7HL6VvJhmKIo
	OKmCidjWsNcIB7NGKksHTC85XUCAn3f585XpVoMgBmJGCMt522w4dhqqOtcLE4+w
	Eu9fK6MhdJKLYdc+9NAlZE5ePTgcob+OyfP8eT0FITrgXsXfSIz/vTpzCGGHGJgU
	4ycX/kPYsDs4H6MltVlwYzqEPf5VzlSgKklrRqRI/QgRSg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw15vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:03:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79013d05471so706843137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992206; x=1790597006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuUiIezO2nuT5fNMnrZdAnpPJ1LY+LflVe+Qi9hbePE=;
        b=GKFxn0dZNTejF/A1JgrOKgXwo7ZStSE09ahu/Ml4Dc4Vn5gZh5E1izNBZNd4VyrG1z
         B9ocngMyfBqkONzW9At+ZbW1h6/aAZs5o7ZSp1hp93BL00DdBESCs1oLCkDAbZ9hZAMK
         pQKs83UJNFSPeoVIcW+IDg6T4ivYXw55EjwpcWarLj0V3lXTcPMmW02/WbuhzqbVP4aq
         +DFoF/uzpoyCCwlTSHnWkDi2RExJ0XSxNRBj0t5L5l67MS3ZaNVEbEsG4/WsLNEIC+jM
         43Ub+qim96jiy02QApVEy+mJqg+YTZj88DYNyKf+4hl9SB995r0xejyxAAfsjKBa+6n2
         aXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992206; x=1790597006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuUiIezO2nuT5fNMnrZdAnpPJ1LY+LflVe+Qi9hbePE=;
        b=fDKbbyVx9zt5aicUTKbrZfdBSkVeS0mAD4+YLjhSxDUrg+tfU9U8JD5Cqu+C+UNer6
         qmqL1NdBK1SeHRT5dhfn3sXsVU4mODsRpk+aCRW3QNW9z5+XM5RrQV+SZtcGPQ058qsN
         oxZQZj5uG7fiBDb7jTXccH1qv8vp6jvZL3ufunGKys8KJpd/HQSS6W7XSjMtjXyPxY3X
         NKcFMjeOUXGHdx3g3pweSCdP6WAMGp2li0iVBgkgI5vUR3ZGJ+S2vqGZoP6dd+ODGU2V
         m+vuYk9dRPojB8YTpX4f/cdJQRxrwvying93JQgpM51fwqLD+kFsel4a07wovjZINguT
         7OsA==
X-Forwarded-Encrypted: i=1; AKwUvByFgSjqLUk7aZz2O7sk9u/+c+LcBGlyMA0F2ETY/CObtzOqoi1aKBoyJhOIQsF2L3ZGdYHsb5JxPLYtpqmz@vger.kernel.org
X-Gm-Message-State: AFuF++mjATA+ULMcJyYjhcV+O7DSabYqiNqBarRZVvmd8Bnf8ggjvhb9
	sqovEy+coERxsXxkCOrUPTO0GJgK04w9QelFLAwS7R21EsydbX7AqPnYCWn/M8RqEPRI1GYIcdP
	p2Xm50xhP3zLOB2UG7BZFXx5UOc1AwdYWovy9jEDOf2TJfiJN7mok9eUhbQGt7DL/75bK
X-Gm-Gg: AYBFou3MhPYPv/aXLQJLSMI5mJgOoEE7GFHZgFvpH+dOukmjiK5775IjBJNe9ivi/5M
	4OlR/09nAgAknU5/qmTRe+RboJnKIjsWolG1QUISYQQczHbSfnttRmh62v/vc8AVuMqeLDJdomy
	QBLVnq8vTJApU4jiWOZ3QuZ4nIOaQyUCiKT6FOI3PbSlYYlRoCD0MZWfTYiHLWmyWoKRZth7TK6
	Kepy1Q9rJepmggp/x9418IG3AN8REYf2z5RrEgPZq0Ts2ZARwJwkCAjNwtTs77iooyENfB0Bxrt
	6NFvcVCG6TzgxuKCiW/7yxQkDR3APzpyqk1H8RjxJ4qxwexuF9LHOWM3/iGeCIyBVoB9tFY+AZL
	tXqjxQMPGKAopgw==
X-Received: by 2002:a05:6102:3e87:b0:7a7:bbf2:182e with SMTP id ada2fe7eead31-7a7bbf21e16mr1506165137.9.1789992206070;
        Mon, 21 Sep 2026 05:03:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3e87:b0:7a7:bbf2:182e with SMTP id ada2fe7eead31-7a7bbf21e16mr1506089137.9.1789992205486;
        Mon, 21 Sep 2026 05:03:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm222876985e9.6.2026.09.21.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:03:24 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:03:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 02/11] clk: qcom: ipq5332: add 24MHz rate for USB UTMI
 clock
Message-ID: <mfzlmrhupyqxj3pj2h7rhqigek2gptimcpcvtn2sk7zfzhj34a@od22z2qpdynv>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-2-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-2-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX+VWDvVJzGpBp
 hmxkoV2+ioG97HLhLTuEAUj5NrZiI1Gj7RKUUyGj/NgIqB5k3zn1fjTBixKCa8rwONgYDju3byM
 Drr6ruZzyvzQQFNO3+Z4sALYi9gqKXg3hOBpZu/faQcD9aLiJR0wxw9fZHpxEyPExbQqsSHMHa7
 qFdFNpXLdg3NVaa8svt4VRP8d/yHTpY8ykXilN4t1iVvVqJOPvS2zLMq1UPqd1NzM+T6O8gq1IT
 ueAJQmnGV3dkUWcdE5F+v2xIIOoOTcmJF647uF1NOc9WKQXstDjYGX01AWHAarEzU7ewj/oxiNA
 FjwaQM0RnOyXIkp5YGkbKJQsqQOjUsZ6K9Kcu7ZATXp4QKaUMjDv/b4R1ZVgRXbZddsYjfU2nZt
 d58CEYXUMQsUp2mwdlc3MM080qMDLsVELsIf3oeyf3fK79siIsx08vhPaFsMnJ1AmXaHFra7A8H
 7u8SqfdC5HIughkEYjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX0w2SZthVgsIj
 sPAiqjgW8CiY4tYTiZR1BAVImN1jWq94+qc0zUprpR3ElWbCx+55nI79A2sqbwxEGSVA4NaUEk2
 k+gWel+XHRhJG5IcRjqbzcPOBPFiTFs=
X-Proofpoint-ORIG-GUID: IcQSiya-coaf_dDfoQrV7vLTlKhx3SgS
X-Proofpoint-GUID: IcQSiya-coaf_dDfoQrV7vLTlKhx3SgS
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab11d0e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaUoqYncsU2g2DIqJJIA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-21 11:49:35, Kathiravan Thirumoorthy wrote:
> The USB UTMI reference clock must operate at 24 MHz, as recommended
> by the hardware team, for reliable USB operation.
> 
> Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
> fails when the UTMI reference clock is not configured to the required
> 24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
> the enumeration failure and ensure successful device detection.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
