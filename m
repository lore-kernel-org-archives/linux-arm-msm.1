Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630495;
	b=xUsD2r0u8q1MEBmxcBtrnIQ8k1xSriAMkKxnWOh8fzkowE5CGEuEDORCfQ+YfcarKs+a
	 2ZisjIjx1uXK9Pk9z0urixhxzhevFEaQO85wIVeYvaPX8LU2k75l2BlmWoZ7xfJ/Zrwt3
	 nAeukjkUV2FgcdgG4BAYhtEnwhr9YpB3eA2b62FMQUERm1/6i6H84DP19c3A1pNtkCRqb
	 Rra5F7+tIWdWuO0qLoFQMMowD3EPAHjR7shdVhIbH7O0lOM0GqIlfFDhqNq3z5FxZlC9z
	 o/Bw0obma6lra0SBql785Gev+LdpUX2qVGAklfZlEwer7lXp3FC7ZhgaZlm29QDXMpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
	b=PsYHdytDPRvK/XY1LhSw40F4y+E8xM56XXzBV3o8DA2lMryDWxLWwn4/aSpqpkAAd8To
	 lslym+ejj/+Tj2BrkX7exh9B6LJlsZ96qy8ecYBnZ/hxkTVMnk0n8EzLOPF2T5XskW4uV
	 gKtZYGRJV6R6wDwAvj7uE2sh9Xw4ssqmAu0G4VakLhl5w39qAd9oKyQ6QCVmAkdVL1qCR
	 BMY0HjywRktrvBJsV9ORi7T5rWESZyf7KIEOiaeUMXEYdDcdcZMdr5xuzct0WTXuGqQNp
	 reC+mfaAbADP9LzUrjeXCE7zpv1N/Xdel9m9thJ51yvA4XWmGTw83PpJL5zr/Q+kSTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZJZS4lI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12696606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12696606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZJZS4lI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE292Vj2843374
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mfnzKhlFqbPe9BxFyLjXeFlU
	GqJhtzF1P/zaxEKCg38=; b=DGlHfkyAVjbLeQibv0xJu7sEyaiPh3sU5qCTX3DP
	4dSkAuzvkY5vbmx7Q9flmQ1l/n8FC3kReG4T2d95PmkSgm9QgWb5yjBBIpUH07Ds
	8WPGozSvsqnFyd7dmZSDKXYFQymbCjb9cCHidPa53QSu8iXqVHTWsRWE1AjKl8BG
	jBDyQBGyz+mq5w4V6gRMuYRTutekiDyjdZIbpukxOBSB5s61zeQD+CKN7FrrUf2/
	CYMnpSr2qHvIt6e6xSOyS39Hin36rXJZf4xmzImUH9xDNe9PtBzJKn9bCli6CMs9
	ldJPDBPfF/cfs3Sc9It7mlO6cWQer1PpMwePs2SfN0hRfw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxekr89c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso3891981eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 20:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630494; x=1795235294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=GZJZS4lIqg7V5bxX98sXboPu0EvNDRg91Nsk8unzzDmjAkgOb7wdnz0qicD9O16DaH
         0nvojy1Tdo9Lw94af6+IC9s9/mAxDtCYAwx8u+M96/ERCx9FYOCLrbbC819YOMkjbbXh
         b6Av0a9Ih3BH8GgD/kyueqSBynTUdDqWRSK0plrEs3GJJV5dS9L8zsfPff3g42jF1zFf
         cj7rKG4MlYl+O1If1/22foctrZFYchi+3Ey6mKTJFgrGshkgcBG76Gp7k5QcjAFkKJ3/
         Yyv4B2EWH7Uh52TbVG97BUOPCqYRI5YTLQvo7oj3vheDdRC5fvg7lDRLOzcrL9OsyuHQ
         dVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630494; x=1795235294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=nVLHYJqYaFGGg36FkvppHyAxeSfLsDpxNzINd/0liooDVm6iByYMAOmYw0xYjr4FVr
         d84n+83YclEjkS9jFUJB5fbYCKcDoTpqjl/Cx4NSIvpvKBl3L1OihrWWztbV4uNrelBg
         cTipdHoc92mo4YvKIvYNHgQHyU8tfmQIJtvDok4YO3luI/2oCLb7fXUAEaWLeoStqL9F
         r5kkaTOrRILvxJK+12K0zzCXWFeyg4yG7T5GAVO9jow1EZp+cZw2I5XidMLms9h7I6qs
         +6N2tENmFfxV9mf6xrWgVcu1ut8vU0wcVSQu0AZjJke0t4YrTLJTFEDnwT9LvUnh1YS8
         OPfQ==
X-Forwarded-Encrypted: i=1; AL+hErEwLJRmWkXulfNl4xvlgF6aSYDPC6pxjYyZt+G8iymYrOiMZef6kbEFLuwrEY5pcfoTkUD5DcvX0S302g8o@vger.kernel.org
X-Gm-Message-State: APuU4Z//DMTsZeRcNVVbCzf0hEu76xqD/s7v43kLReRMpldeoZ4+YIgf
	JbtlXXxgrjWu39uGb3Da/9vexmBgP3YMkxH2zXx4TjkFYE7t5hsxZd2e8QBVVd3TL8jpeNJbfBM
	BAdueaHHu12DGpN4S7G5h5sFEL2RLLqggdYsRYAV7/j2Zip4P/A6QHb7z7vaUbEU+7QC+
X-Gm-Gg: AYBFou227homLnBE8TqeHH3P7k32yhgHvPzynK104XsdOFPqWr/Sz9D2JD31gj6m240
	YwwHY0y9EP4L7dF3VSl1jfXORjAwDYyQ1wG2D4BoGICCh5ErVFlX5dfHgAS7u8PtWyBzE4ptLSH
	XR4lymWEFhia9b/RMkOE77NkbpsoFi6860BYtEP3dUwNCb7ZE+BlB+epsJYSDkYSUeTycN44RZd
	zdKFaPcgPP1j1F2TYKc3A76YNfj+EmrDkcOruua9KEgq/rhMFIYB7KRd/eMvbVOWrubd6kjiL5x
	cpHp4HpX241idvk2MAUeHPoTaSYpjx5gXavl6ii92LQ4yYZtvWuC2RWKY0hig/qg3yHXxiaxEft
	iUSqFknswM2hQGcU+CcwNIVYVIsbN/8QF+gAw8IB2XNBab9KQNeskmkw9k0oHWs+v4pcnsF/9Im
	PAotMSWJmBXxXv42U=
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499141eec.23.1794630493331;
        Fri, 13 Nov 2026 20:28:13 -0800 (PST)
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499115eec.23.1794630492711;
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm20332733eec.25.2026.11.13.20.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Date: Sat, 14 Nov 2026 12:28:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/2] remoteproc: qcom_q6v5_pas: map SOCCP carveout
 privileged-only
Message-ID: <avfjVqCHXABFg4ue@QCOM-aGQu4IUr3Y>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
 <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
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
In-Reply-To: <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: M_5ZhGErTwy2q8_VufC_jB645NFaksA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX6a7Qk7II73yE
 n65TP9//ACkpp5OSTsneRm5sbtjBu0aK+147uJ+ni2qWU0se8cjKwCbId0Q+OmK2htJHmLZAG5d
 LlIrLwP/MfkNeCX9hRo20j2AnWxyGoSkVDpAT2lIm37j5mE69sJRX88siMP6ho848pW3dsxL7Ti
 Y4edPYgviUs3tfzKlsyGDgt+Y0XnHQUdhghPyI06jLJTckTHEDHHXTZTiuSs6Q3mJIcrchu5PLB
 OjCRU3xsGc+sDDpoylctuOb6ypwLtUlUt6HDWjzq+Heahee9+xxJuU4iHJbiFRx925yvrXsEs/y
 Qjib10k1ch9LSvpkS8hWHrI0hrgVgwB1U27BSEUxMXuOuhVc+b5bNzFmjHmvo2bQraXwg0EP7fZ
 FTJvkdYe2LCkHZy3lfVwjg1pY0Q+omA036UEqw+wichSazgcrPgAIMTBWRuYK86lSvRVRZDfWRz
 rlacx0CB2aGvCAzUA2g==
X-Proofpoint-GUID: M_5ZhGErTwy2q8_VufC_jB645NFaksA8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfXxIuVtAlJt9iQ
 DACzgqOB+LBy+b7v1gBtOPXC+A+zUDMFzH3wWmXq2QPMEdLSGrbd3xiaoZxlIIOPEkPJxxuPME/
 WSN8eMJS+xcGE0zXsPVuH8dPGe6wUbI=
X-Authority-Analysis: v=2.4 cv=AfAkjHXG c=1 sm=1 tr=0 ts=6af7e35e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=d2ahPazU6wztV3fc8WMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140017

On Fri, Nov 13, 2026 at 05:54:13PM +0530, Anurag Pateriya wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> SOCCP is a RISC-V core whose instruction fetches go through the
> SMMU in privilege mode
> 
> The memory region is mapped with IOMMU_READ | IOMMU_WRITE, which results
> in permission fault when SOCCP fetches instruction, append IOMMU_PRIV to
> mapping to allow it to fetch instructions.

This says what fails and what makes it go away, but not why. A reader
can't tell from this why an RW mapping is fine for a data access but
faults on an instruction fetch, or why IOMMU_PRIV fixes it.

As I understand it, the chain is:

- Without IOMMU_PRIV, io-pgtable-arm sets AP[1] in the stage-1 PTE,
  so the carveout ends up AP[2:1] = 0b01, i.e. writable at the
  unprivileged level.

- In the VMSAv8-64 stage-1 permission model, memory writable at the
  unprivileged level is implicitly privileged-execute-never,
  regardless of PXN.

- SoCCP fetches arrive as privileged instruction transactions, so
  the first fetch takes a stage-1 permission fault (FSR.PF,
  FSYNR0.IND=1).

- IOMMU_PRIV clears AP[1] (AP[2:1] = 0b00, privileged RW only),
  which removes the implicit PXN.

Something along these lines:

  On Nord, when Linux runs at EL2 it owns the SoCCP stream and the
  remoteproc core maps the firmware carveout through a stage-1 SMMU
  context bank. qcom_pas_map_carveout() uses IOMMU_READ | IOMMU_WRITE
  without IOMMU_PRIV, so io-pgtable-arm builds stage-1 PTEs with
  AP[2:1] = 0b01: read/write at both privileged and unprivileged
  level.

  SoCCP is a RISC-V core whose instruction fetches reach the SMMU as
  privileged transactions. In the VMSAv8-64 stage-1 permission model,
  memory that is writable at the unprivileged level is implicitly
  privileged-execute-never, regardless of the PXN bit in the PTE. The
  first SoCCP instruction fetch after PAS authentication therefore
  takes a stage-1 permission fault (FSR.PF, FSYNR0.IND=1).

  Map the SoCCP carveout with IOMMU_PRIV, so the stage-1 PTEs are
  privileged read/write only (AP[2:1] = 0b00). This removes the
  implicit privileged-execute-never and lets SoCCP fetch from the
  carveout.

  Other PIL subsystems (e.g. Hexagon Q6) are not affected as their
  instruction fetches do not go through the SMMU in privileged mode.

Another nit: please use SoCCP (instead of SOCCP) everywhere, e.g. patch
subject, for sake of consistency.

Shawn
