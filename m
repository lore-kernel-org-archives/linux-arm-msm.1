Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6E035F19D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640381; cv=none; b=DBXUgnoQ06cBb2Koj86A5Zp77GOZpXu8NWQZ5e1r2MTFTqdELswOG+ZJ82j4Wp9mpNN7wqQHRmkMvBXko6hxKyUuA6sfiQjDC9StAV8nTRQS7vGGECCDkuB7EJriaKNGeXgj1OOmrnTIwcD3XtAxSymUUY8kdVIUGB/dwL8827o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640381; c=relaxed/simple;
	bh=+X5Vmc5JQh07q6Nov31GXwJFBkmhmIGmaMb3u0N2KGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4grvqQRPoJpVKY7+mljhi8Gy/z3ACgcwPUiA/12PBlTuUf/h3d+vD6JSpoUInrIWE14itOBagsP2BpQ72J3guSkvShqCRu3x+0vAXi5tMcFIR4VBIq3+ihdpfR0jNAk+xGfbNR9c5wTWNS5PLRfBNbUxkPlIhCkQD1A+gGwSbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPFanQGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ct5uJhW7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPFanQGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ct5uJhW7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMPl51352033
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eJJD8hnyEYrImPuPfwJ++h+X
	ZhimrrBdPblV42zR0As=; b=KPFanQGq2EoiONtGdS0uRkOdBhPCVfEyF/CPrMn6
	bsp/K1gMRhYuA+YnALA6ZtYc2Z1qyfzpPV5gXI2SLCIOtYiLNTVSMfLYRP2hzruA
	cq6bhWkqOSAMLX2n2Darj1kAqWy9k5oJA9rFh0tLPHrQIggxzcWJ9oEKo7EYBbTl
	Sf4+CrDKFXUpamg6vYY+u7MMVsI+4cHwkBw/cXOubY74WCTFY/895oWDpKgBGjMi
	b4HKfMyz7fJI32Qa29b8SBMEkXHRbOYI0MzA6FAnQdhtMJGGDkj7mRUobAt77+21
	ucD3+TcPvLlFM6QUt/krABHjNNvkRNOqFXjXlZ7jBGAcKg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es2jpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:26:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-745031889b5so13684593137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640378; x=1785245178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJJD8hnyEYrImPuPfwJ++h+XZhimrrBdPblV42zR0As=;
        b=Ct5uJhW76i+WuRMyfH8fPkdXlnekVVcoNofcvzErijF95+tel1mQWgcbnak1U5MljG
         ubfCCMDxYgnfHUjL6a4pV5vaytqBZJuzPGfq/pBVYvrSnKyj4YFsEMX9UZwC/9dJqVtu
         MxatbJUcqhJllXpXiutQytg6oKWFH15HVowqwzol5Q86X6KD01gR+Y6IJTECsMmUsQ9B
         z0JbvP3rW+f/YxU43rTjwAoZpezI9Ok8SQStf6+mhryf44TzGqN8GdZPIBQrGPkdR6Gi
         2PIojfr/JPwo1nhCfGDUwH1bsfjPIfOD4UdAkayK/ptEkeckp6bRkk1ue47DJ+ObOdfA
         9EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640378; x=1785245178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJJD8hnyEYrImPuPfwJ++h+XZhimrrBdPblV42zR0As=;
        b=noKr77h9jWDeaaIOgGFVTOcivCXCtuA37gGjbeArdyXYkBsBbKR/ViQ6kvzbXxGZrn
         tTH9LVe6PHN52GcTx6HQJXIemU9ENzhl3BBSQ/VUcjhHntTuv1+J3OWp/gKj43nPD77k
         xHirpNAtsjBMzEllOYbUNhv+JxZXpbIyJx86PrD0FFRrZ0f+ArKMSfbbjQ2G4EX0az5s
         wj4ail07g5xYm4gleJU2hKHntSzv2RDT2HGRznEWRCT5jXjiLgGWdxdGahQrzB3aztbs
         ZPrzeFsLlzaRfqrUZjuA5iv9RqFXAwLnB1Prv4RBX8RwtgjWBwUjlHz4mv4vnAcOoQWU
         /mZw==
X-Forwarded-Encrypted: i=1; AHgh+RoFIBnhIoW8d6Ljl7zdoFkJ7unshf8Zmldawrco/jOU2ZOExAUUQHycUa8by3rwqBNodmPxYwLDtLy5GF/L@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJLivjSNBkiznFnnCen9/aJK3x+xmSxyOOSrs8yWWqL6Fhqf/
	BUmLvFXloMaj7orHdRlbcHkkN7cD+WBysklrw+kS13V9CTWAgRNEZ5XWAfPFd0vNw/ICWUfDFgZ
	7SkD56d2Pem0745NNRWDfpZfeNz6pWbaAIgIsHJn4yE/0H1nE6mdrE8v+0BKtqbWiHjZ1
X-Gm-Gg: AR+sD10cfCk8Ife6PztgtTYmgzRttV0ts88MDSW558mWmAUj+xonlYid1kY5BjYlipS
	kLofsi7x7kfBbFN/6syaVOd5hceJ7PfRWc/Ekw2I7OzcK/UWE5osV54ewPramvtERLG6WZU/qik
	7ASuz1XtdhqcXZwOPuNr2f2LFKu8QKyhhCmQVLqvIMDnzXJqvVSVw9uDPjZ3zz4myTnvxZjTHYY
	OM3gC3x1Ao2DJyKSJ5Lea2qW7kT4mfGD2mfNryuFoBsP9rz1byKShIv62xqSHAg/Vo74pig5iv0
	a32OsFWemlgCXhYXvIkZ/bzfYkCQCwG9Pv9y/QWDxzJX6Fpj2mF0bJnydC3gSi7Ux5qm/x/Oi3m
	Q0VTldPIQBH2m2116r1vpkZKYHX8yTFghEMCqZWis9GKDqqU4+lDlEFbtwRvAbVvI29ort/A1sr
	ebaStxwbDsGPQ4Ow==
X-Received: by 2002:a05:6102:6446:b0:738:5e0:b40c with SMTP id ada2fe7eead31-747537027b6mr5471212137.24.1784640377820;
        Tue, 21 Jul 2026 06:26:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6446:b0:738:5e0:b40c with SMTP id ada2fe7eead31-747537027b6mr5471199137.24.1784640377444;
        Tue, 21 Jul 2026 06:26:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4e5d3f2sm18587211fa.13.2026.07.21.06.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:26:16 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:26:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <llb6unswthnp3awriyvwb5ehyjammdibce4nekeghursyj5tdw@lmcmpa7bviza>
References: <20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org>
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f737a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=rsTs0e5u974QGqZC5H8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: usBByIIujdchwsrxAsa8s7BCl5AJFpE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfX1oTMv18MO0Br
 sjLP85rD6BOsaQDUwdNy2jl3ktiohMzcjpMfSYqTLATylhoiTVPhfjLZqVch0xcqNVubhLmil/H
 Ja9foY8f6GrwMwdA8h7dwgBVmkkcPU/Wc4aJaDtDVR/IKlL0ljfRZqjM4I1JxDLMEH3cC97fQ8t
 gewWQSjnx1SJDBCX/fRimBT23SMWbF4EWW4tWl8EhSgdXG05xtKJ9/IBDcugROLv+DHzQ2cnNRN
 Ck5WjUJpFuVM1K7WsP/8Wkg825W3R90VCTtWBONFITM+nhLBxvWYnNhAOgfhB0vmyb2fzYVFNq9
 SZTHcolCGZI2uMqgEJtIlQm2+nD3DW34wva9ZAGpDQpc2P5yWnlVPFs41bJwJP9qDStQp1e3Z1j
 lOjZH9B/P2ZXNYywWkARIfobO9iujUvDQUxjJGikiJFO6NTg173k2B8NJ8TKDcmKI5B26/BDM5M
 8h4q30GUZrC7QgoxKFw==
X-Proofpoint-ORIG-GUID: usBByIIujdchwsrxAsa8s7BCl5AJFpE_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfXxLFXC9G7VFKa
 C52Ff/GnAJLr+hU3YEHTRK7JyZxREuE2cSRa1N2LpA2/SphFmQxiSU+cIIWzhvV0XVp9DmLXue6
 fBBAWQT955TLQCj3LGMswe2AWeGizZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210142

On Tue, Jul 21, 2026 at 02:10:55PM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on follwing bindings, all applied into linux-next:
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-16edddda9951@linaro.org/
> - https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
> ---
> Changes in v4:
> - Reordered regulator & mdss nodes
> - Moved zap shared firmware into separate node
> - Link to v3: https://patch.msgid.link/20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org
> 
> Changes in v3:
> - renamed backlight label and node as "backlight"
> - reordered pinctrl properties
> - added regulator-boot-on to display regulators
> - Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org
> 
> Changes in v2:
> - Update for bindings changes
> - Remove empty line
> - Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
> ---
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 244 +++++++++++++++++++++
>  1 file changed, 244 insertions(+)
> 
> @@ -1411,6 +1602,20 @@ fan_int: fan-int-state {
>  		bias-pull-up;
>  	};
>  
> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

Should these be referenced by the panel too? Or by the DSI controller?

> +
>  	upd720201_avdd33: upd720201-avdd33-state {
>  		pins = "gpio123";
>  		function = "gpio";

-- 
With best wishes
Dmitry
