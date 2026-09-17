Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD04DDB2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658182; cv=none; b=eSGGlI+5jXii+jLfphttSxkJkA2LoKwGBYJo9tx/gpiktGVDV33p1v91OuVDHGayuNXfL8WC4nNqblXglMN2KYbN2UQaNdz7om6PyEgnX0AWY3t68yzoNPv8eULKs0JxoEZzldcITIvvmD7Gw++BjrVCGkuoaNtuw0lDn8q1hnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658182; c=relaxed/simple;
	bh=HWTYcYmqxnMfOvc0toVfLAh9HcAZf26tjOq5sUKW7ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9nD0ino2xhL7zb4HSVJdQJlkERzkahgn0fMKVCKVul5H6DGPklW8/iK+xdQFGAJ7RWCyOZfihJmzD4VgLy4Flu8dScNhvfbJuQEfg5q6seU7KZ0y7geklA/9JuQk5aE138qKj+wlFUjRf2U+WXhl0Zs1jOT80ZtDiZhze4HdsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO6Yq6Nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhQxwfsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO6Yq6Nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhQxwfsc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiRj52265057
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiKuRho5vpq4oB0Iyg7qtY/3
	GWuotzNlqShh/ODLOOc=; b=KO6Yq6Nm8LNj7p9Z45l+BYAzzTU9HZT1iv+8OoKu
	5TbzurtBQG3TWS3mEiUffDGQzlgiOZZlfjUqxqqjKXPg9bbe23RD6esyFhYHObrb
	HngdSGVSqR5YD7r98kW8hwCzRMRZVP+8fshgxANRaXXXjvZE30onkzjul9FMZQeI
	aJu5PrX79l1+XCtnqewDgpMrAlaly/eNYquohJmNjKA0dja4740VAipbLQ9oZ0ZI
	Rm/m3UhsTGDgiWqt7KOZsoaPwYZeBtaM9CqEKmTjSGLIDAyuYJrZM7zdg2uaSIHm
	4mDxIg6iB+ZibwIB7LbQeqj5NTA0OLjQdHFcOCNfjwA/2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppgxsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:15:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530d43c9a55so18481381cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658115; x=1790262915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiKuRho5vpq4oB0Iyg7qtY/3GWuotzNlqShh/ODLOOc=;
        b=UhQxwfscjnPPuol7K1D3UDA3nftmsuAYpUUN/KlJhkKZsAPLsCahqNykviL+QvV5ti
         IDM/1l1FSyh0RnneFPtvd+Ww8Q8cDA/2vIgZ+/5smtAydgudfBkgmkMdclhxkKUeT6ZD
         mvdvrKbP7c2ykBbPeCE+yjoIHkaBd+RHRd4+bRiDDHf2BqUgfVY7uJh1s8IResozx29P
         hKek/eyoBrpeSbSQ0nYtTVo5mcCljhS5BkFUMSiYeWmrGf1bVrdn6qmz5nIao5gTMl/B
         J3Pm4lsKelFonR9/nA6DdtyMH75RaUus4g+G+00JaNfsGPHZ3v4vRTMBid3WUWWxgAc6
         zUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658115; x=1790262915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiKuRho5vpq4oB0Iyg7qtY/3GWuotzNlqShh/ODLOOc=;
        b=bFj8YhewX5ff+ZA2pa5dB8TlYH7CLWUPR6rTJEJoHAC/Vn1kGNxpM9H6wBGecd+RCZ
         tu4e7G/uLQwpzBYzc7UbC5ft2sxOQywHH4EXdKCcUb4khTYjk2MxRkpz3zG/wAJaskV2
         nCrXUZ2+IsP25nuNlSA2EXo7Y7HnOzbDQ7qjfv29dNfIKGHVrBlFo65BJ6w7YtizpnRZ
         r9W5M8DzZYxcG9yLhMvD6tff7zua4C699EdlajoKfV/18SNUO1unWAHVc0ipbwsR4ZcW
         rXCpPjIjEtPKNc3wmhMEvcI/WPHKWFvDC96CeeQmowklnQ2WbZL/f5yrcDX0HexqEYK7
         qy5g==
X-Forwarded-Encrypted: i=1; AKwUvBzK8frMRojEsgV2AUFV2oTEAgT3zxZnXMVm3Vz+FS0VFduJGU8MGW+jtIkp1IkMue/NJSPEGjDxIZQXjPth@vger.kernel.org
X-Gm-Message-State: AFuF++k7mIh3OkrSf3+W+ESj7HTkAe8a8D/M1yh3WvuUso4Ru5hmVUGY
	uMzYIdYC6mgmrwjfee6LCXJhgq2sY33L/5xigMWvtLyJdSE/bthF0AsHg0QemtBoUE5JZ8vzkic
	pF/qJSn6arAHSrZbUmSNHQs4FstM2lCswbcIuoj/pBQ1KoTx+oqqZLnSJeXzVLW4ua8mJ
X-Gm-Gg: AYBFou2fYLopGttghlr5oVvte6knlwoxlRslec+gN9dkjAJtMX9rL9lS4v7LkPOWIwK
	IhdwpaF+hqvyFNoxEv4A9nis6kYo7oVd5Mtk53Fjug65nisAEPynsRitwoD+nqMi8dEx2V0rCu1
	1GipFDeBPfhLiAIc/TwnSfqlOfzyD5qf6PWwhjhTZkH45qVorLvTLHTmvtw/D4roSa2T63Gt44a
	Mogwlo330CL/j90j2wWxh8GUl62i3laDpgddRf30qd+lzSuEILSyXL/XDmNsKdSHuAEPlBPALJA
	D1Mccxp+FDjFRzcGmIGr8UAHKQ6mDflMjGY59lbrejKIzvnSdzxJMA35VKwWZ6DJ5bdwlYCr/WE
	GnrhEdQo1LboP1A==
X-Received: by 2002:ac8:5f50:0:b0:532:9adc:63ae with SMTP id d75a77b69052e-5329adc72b0mr11447511cf.63.1789658114779;
        Thu, 17 Sep 2026 08:15:14 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:532:9adc:63ae with SMTP id d75a77b69052e-5329adc72b0mr11446811cf.63.1789658114163;
        Thu, 17 Sep 2026 08:15:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2563ccsm102251575e9.13.2026.09.17.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:13 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm8650: Move PCIe phy and
 GPIOs to root port node
Message-ID: <si5cdl4yynao6fdx4mtaiccoryryxtdqgy6v2og4zln5q5e4ew@hkmsdncacbtk>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: hb86X8CaEoXQixlz-9auY_oMECNyA2IB
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac0403 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hb86X8CaEoXQixlz-9auY_oMECNyA2IB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX5djz1yC5fuQv
 nn19DQwh/R3LP0qrI7NcbqxS9A0IkKXpkuv9+CkGl72ufrnHEYM6tmmygryZuvCdAPZISFnYYGk
 DprcT9SFsuDS7iIOJsUsBkF4bdO0vXCN4STZ14Q8xBDJV4zBcuQE4MwwJ9/bxEqBc4Kco83mTpf
 s+VC2ZSBZBoYt2G8XgfLCp9c5rejGKeDlVNWR4ATsvBcq7SLNT1/rMbo84qsM6syTI/dVdplZTv
 2xxiHJVOlWv7Lo5VKo20R5jSKFAVkP2PMaza+LRDT89RDF6z9DOcv1g22eh7XS9WywyftNrcfPq
 1pkcB9iPvSyGaXCiUk8fereNSbZ1va6FxjgA4PD1vYcRf/VhTF6y81XWxIwZ1/QCLbNN+Lr0NmP
 7DLMtvueerHCgXtPJ2MUkqsc+BhBrXbekH7XYQTy572F2J36Z2PIDyWe0c9wsBU/8ptALfC+eZa
 2Za6GC/q8i8peLNKeEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXx0jhYWKPLRaC
 FwLX1Dm1j40ijg5IK/HHF7oyTb7ve4lUExNrhNcOwcOqT5gUh8axm3JANYM4fzWLQKz+bOrm5uY
 8f5ZWi7k/sMnvVlULZKRZ5D1ZgGpDLo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:26, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level
> overrides. Move perst-gpios/wake-gpios from the controller overrides
> to the respective port nodes in the board files, renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
