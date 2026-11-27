Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811613;
	b=qwgFXsFz9YHp69tu+CBYHsx3SoSrwMuamM3OgP1ainY3mlWNOMlgzameiAnQ3G6IMg8D
	 SGXV5Rw+3SIanHrYvH8+pO2vzQlvk255d90Pnjhz/Ed9dTKaoew2LSloVCxZPjYcK0XGy
	 Bk5XX17tafwjLYIA0JeFvEWKKt1BKEr4aBeLS5O3QElMFU5DB1PJoXyI+UQRf4dUAdNwN
	 xFoJSFXbiSoCUOvW19zEnsFLsdCCTdEw+nrB5wQFmve7AAO9oiRizaqspjYPFhm1+tGSU
	 wYAIORaevOJzOYbZrm1Ajq3dBDJ1FYnFaUgKMKwy0uXhciWs93D6duIfr25iv4Iy8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
	b=bxmI9ZxQScAJBeDiUqHMaGrcsYdaNG3O9a24lThUtEuw4trZdEUFpINC8QIiXUjHACrB
	 ySyeBIEDMcl3n3z5ehp6q/uWt3fGKftrEPcAcVbCM9cVMUN69Bmmc9vhgyQolS2ouI1gj
	 Yi+XGpEKBOzp9kitujZkrJDwDzrKEmEyRObEv1/q4Ztgy/47Cw+6hHBjcnlygqzsfpVSH
	 E60FlFipS31JvlhSSssMj2VsATg4cZJxXIs1mNq58etYMfQM0ruaxnDloydbwIBGZviJb
	 gw2Ya0o+6iXwEOyWrVp6j4HK0MubnerQVlR3JrsCrCZRmcy2GFL8z0rIFn+4lfvOQKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2MjMSug;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L84DJlpL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3491606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3491606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2MjMSug;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L84DJlpL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAtiM2127784
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=; b=D2MjMSugSyFOtWdo
	Sp1uUzUX1NZqgct7w1uRpBGcVaYMFGHXMED3izaONkec1MLq5ZlP6jIxP/YNF5H1
	Y2VGLqR3svxU9W5XMjpf2ZNcqV9j+SyDzEYBnlOBDXtjpT6XS2PATW4W2BZf3eHX
	NkcTV+DdzgdxKq0DKZbDI9t+auOGaruKHmcUCYOo72RaT4DvH6ZrNS+bJ8+kHarw
	zuqdjhP54iLWy6UHtyeprW5sIzU+/7CaiAzsBEetOUg02CdyIcG6CUPKkNMlwhuU
	ZzDuWOj85UQPBTCyVkur/MAPB5NZFfCHGdLiwfSqOYIcMtLDXjrDOKzrRyFGFPpc
	GR5LjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e7d0eg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so1254349985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811611; x=1796416411; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
        b=L84DJlpLQMuuLX1474Zyqhz4pjYjnDMjU1URHM7HjHg75nD+197BbJCSFg/4s8Hyyk
         SVReOX+CMRX6BpffaDgIx1UDihf+AciNlTY7SiSEMtI7H3Ol4qTVHV499rjf4dJ7WFx7
         WnalSSOza2cqx7gqZR4BglJS4FzdKvQrU6P94Y1M6TmOWuAZm7ZMh5GuZh38OEu5zCxv
         d6qBpL4vQcA9OK6SkVrESbKrunA9T7QN3y4QosHcBTgE0umeOM3/7KIvrPVEQnwxantF
         0Ox9C+7uEsh0cDg/zqtMj7y9NTF6QuVglwV4XXB5dM5elGzvfC30kpe3wPpzUt79yJq/
         yWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811611; x=1796416411;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
        b=czaowxqXSTji1dm3x+bumXO2+Wocpj7TV/ULJu6OT7CazDxC7J+W+jUJizYkuJhfJB
         9wP2sRhmrgO84clE7WbHDfpDgTAVFehCJtmcZD9w2V8XwOQJFdNpKN+3814Uhft1M7d+
         RjGSIDiKXy1htiJgaMn12wUTH83JS+y3VPJ9zMrwq1tFoM7xz3HkZuG2UYKpL+4W4w6M
         NVQRgLO/qLfFKLHErfpr2K8dTbKkYM3C78NyNwoFcwpG9VUf8eozMf6h46riydr5WvLI
         0i0EW/HjvUhJlHKh0LgB39ke7Jo5Or7R2uC/ZVOiu/UY4fGW2VmicoUk3lX8u9Ru7gcc
         RBmg==
X-Forwarded-Encrypted: i=1; AL+hErHs1RXjlmKnm9Wtn4ELOq7O6Fkc12MZ5bLprJNBT6MEH9bRQmNklbTbQK9LzADQ5Bm3qGUlHDkWu6bxs8jg@vger.kernel.org
X-Gm-Message-State: APuU4Z82kQur4PXMPTOUGh/NTm28nuIZcPKuPeLgt0fAIsKklZEDxXjY
	VhY6nmdbGy+pBcvbRwscLpkCMdwr68y+oKrdP/P6RJxUe6/pzBGXFRuxew7cydNgIKVn0ijcp/h
	nMymAy79It2gS06YlYnPvReI4rbuyWPajqc6A+9uofg2C5nCYLo8oU1f3lB+BLz5xf0Ja
X-Gm-Gg: AZFdTZd8U9q/5xebvAnNZ3ltiETolsKQ5tbiCJU42TNKHQuSztRLtInjAVAox65pqhP
	d1L3cf/mCheSgpPgs+VDWSNA/k6kzZH3KjCCjFj/BoPutIPGZrMxoqhGSGUJvLqPuisaIsmsiJf
	PL1Uy2NOGxOVyFq/zD8amlFKPLI+KpiL/hvfEMwFZxedlS8CZF/QlBYXXIzV4nKcCaF7JhQsWLb
	PZEriGeZYu94RNpI5Zucf3Vb0Bb9WiOc/3uKuP4YFcuzR6CwNIk7vIGbE+2ZaH8ZtiaTCIv1v+0
	jFYdxitNaJDjqZo8JqZHkKzHRUxqh2/pP2v46h6AEHPmHjY3vh374WpYG3O71BS/fPweZgoYxOk
	avNCDihSwNF2titkF0cAGQgJrYAMha1+/H5gBn5O0DaRBWEPi7uVB9mM8oyiOxA==
X-Received: by 2002:a05:620a:45a4:b0:944:110b:d824 with SMTP id af79cd13be357-949ba8237f7mr4779004585a.5.1795811611282;
        Fri, 27 Nov 2026 12:33:31 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:944:110b:d824 with SMTP id af79cd13be357-949ba8237f7mr4779001185a.5.1795811610870;
        Fri, 27 Nov 2026 12:33:30 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm46444385f8f.26.2026.11.27.12.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:29 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add missing Iris pixel
 stream ID
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com
In-Reply-To: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
References: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
Date: Fri, 27 Nov 2026 20:33:26 +0000
Message-Id: <179581160665.3905807.4498492741251530885.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XqhMIJBK+RPI9EuGkx2IwbDPmDLtOjbw6QtNrwL4lU=;
 b=owEBbAKT/ZANAwAKAWNNxPBocEb4AcsmYgBrCekY0S2fVKfwIFjsjbQyH7g+1QmnebDfpTH5s
 GJhRi/o3/yJAjIEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpGAAKCRBjTcTwaHBG
 +A5sD/YqHN/8avpwZcoXmtTqsgBr2hSift771T4JYQX5ple18qgGo5YtYwTMuVRoH2nNveoBRZq
 VbBDBYwJSvoG5vEe6L/UfCDX2OrskZj6+Zn7MikoeXixmIkCYrjL8nhQPgMtbHjsxH0K2soDl+c
 nOuWs6M8/BV15dI2gtAJKhslnrbECsvGzkzLSMhs/bHID9AcmIdmP1TY4y2uA2gtiJQ5uFHMnbY
 WzBexs1oh1gWkK1XkAcp28UJjRMAPSeDWuOGx+PPyVpDYrW3PTKRb+NWL037ZNIPZ6K89hslAiU
 ewuoCKqGR96u3yDAoE3wV/FvugvjQQ7XvM3kzNN/zImeCDK6ISE8txwFhdvXIm2zHdDmYciaeOW
 ygL8p8up1FsRARwsqhL4DdB+/GkeQr/wwqRzlwmC1tfePUjJNbhB6Smd3LG8rmS82G9w62laRcF
 qT3i3KScsXMeJ+7bNro+qywgitWDEUCfHA1GqQw1Hnc9GZaVtqqpm3PCyUnbjkuc6Qm1XiQeBje
 gLVQRj3qpfcm0hhEGdzn4Gf8/O5yu3O6CtjY3QWGDsdUC9htgBs6LNG+H40Vdewzmk+ZdOafxBm
 U48zm1p6mNEWOw/4AJkzHqV2mme5pKn1BKSlOXx9+k+SA8YKN+U97aMpYunN7HtJFz7ppztlDWo
 cvEeeqhzWq64f
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: MF4shJy_MHVfu1Tm_WgrvBVe1vZOYcxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX1L5B7RH4DyM9
 YZ/l+9k4C8Tu1vT0m8td1AODk0JqH/BIch9slXITLBMawGRCOodLNfqJPD517g+g+oG87uARxD2
 U9LumwCXQMV/ZUT1JzlGnBp9b49MdNLksqSlyWEFvUmyy8BfT/t4yIZrteefgUqwu2I2/Ug+v1j
 n2LxqOoFo7FqGUjMXxoSLqSEboxo0RDASn2Ru3RgyvwT3q9ssZtu0wlgK6kj6JEgmb6RfNx54s7
 beReQDwJ6EevSPgdBnC8r+gg6WRNRyE+syQYxBB21zcWFiPLeDccX1ppDecL6LsIWguNlpkpYut
 ovj4kxiVTVdoJQmsWpm0Yn2Uca80zZrmYRf1XR9EqByKMEBpNA29RWDCvaMmK1c7/3iuHDu9df9
 Ntmsq037zTeU7Kksd108u4co4+4c8/IzXBMdCA59rSzpn5sc1G5i48Ggt52AKJ97lZBGKu4xeS3
 mD6Wk2XIkLfHiRwgteg==
X-Proofpoint-ORIG-GUID: MF4shJy_MHVfu1Tm_WgrvBVe1vZOYcxF
X-Authority-Analysis: v=2.4 cv=cJh1IVeN c=1 sm=1 tr=0 ts=6b09e91c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=d2b-pOcihrNWfEhQPYEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX0xjhKtWa2OX/
 nQRVudHrl2cpQ11thg7mX8YfdbZ+K4AV3Qe+fuzoVe4VfKoP04HFFmJ1UfWmNEkSAI3zxZceygF
 wDS8YzQYqMVwcNUM2ZzBwv3AfAgzkx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Fri, 27 Nov 2026 16:32:21 +0800, Xilin Wu <sophon@radxa.com> wrote:
> The Iris VPU on SC8280XP uses separate stream IDs for its non-secure
> non-pixel and pixel traffic, 0x2a00 and 0x2a07 respectively. This is
> the same split as 0x1940/0x1947 on SM8550 and later platforms. Only
> 0x2a00 is described today.
> 
> The Gen1 HFI firmware sends all non-secure traffic through 0x2a00, so
> this went unnoticed. The Gen2 HFI firmware puts pixel traffic, such as
> writes to decoded picture buffers, on 0x2a07. No SMR matches that
> stream, so the SMMU raises an unidentified stream fault, which TZ
> treats as fatal and resets the SoC:
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

