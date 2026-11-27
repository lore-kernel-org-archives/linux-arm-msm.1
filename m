Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756996;
	b=n3b5CSpXlJxk1C8Z4vJiE5r0HSNfTxgfmV+Nr+aK1fDLGsi77FjiYV6v8WyWNRy8s1+L
	 hzHUX9aLS7VNUVIxT+wKDPS1NBxWOQdjEF/Aua7uIP32qclUmDxlTReC198N5OW2q4SiH
	 SFBpMAy//1ErCpUj+4i5znP+2Xf73xenqG+BG7mS/VcweDcavLFO+PMDNEsOsd3r4dVlF
	 lEpPu2rtwTRx9ovNlGpvfL0H5mHWb8JnyltvqbrY/AGgxuKxOY2GhxsO2Qek4gVcB9d36
	 j2ucom5t7kKpEDgvvD94p6uK+oYewmYvqk27GNpBH06hqZIZl7v5dLmqyZrMuK20JQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
	b=y7k6c8pG0kIEUu3Z3+7eS9lsh5WaYn4PUUMtieluuBBjg/9dDwS+0Upes1GaFbpaDE4T
	 A9S5ZZW8pCePmHhwJE9xcviDeFVIajLkxH2vnfadgL5WPIjT/4n2isI2XtWXqGE+nT9hx
	 jOBgbhbhlbdkL5olnpjIDqyUkvgu5m2iuXIQdqo12Wdk/e0zbwxUy7kIUWMlY4+ouXkVs
	 WQmmfr6uEX+BE5gBPjt8HU78VwS/dqisbwzsKYw+ebo8uK0ubd+G70tfy0Vj79z/J44Um
	 VOwI7zH+qufi4BK6GIFtdnCZjndizZhor8Sxqg8iiiODWLAltQeGyPPMfwx5RdaUAYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6tDHM61;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST9TcywH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3D606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6tDHM61;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST9TcywH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw67G061008
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EAGgXcLUFrPzdFT+vediXn
	Dt2ttji9J/V8iM8d9PPz4=; b=a6tDHM61NCKQGAXOTdDYFT2eUPx5PGXZyI9jD0
	ebSSE2QcdZtlPqpwMmQf+YmhbGoBQOz2EsJ22rxItFrmBJ65m+2SXGWzbJQR/Faj
	FnaBXRMJvxoTN3TBushNePmvjhy2WkZOKsxm9+suIXTO5C3bLNmCNitn3muLYVMB
	aIhHoQOVuHZsk+0MtDYRZ1aJssUdeMWN8/5m+numPLKIZOryK7IzTAlPKtFjqjBY
	ZyegnpJxBnkuTdO2D4rNmrBr9HEHixTzYw3S29XJlxvPepFedyRko8IV/0vU2u25
	q93dhMU9LJ07QvC2PA4po/aZhbS7mMvg28ANWTRUjfNquWag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hsch6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:23:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b434b96117so1372663a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795756994; x=1796361794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
        b=ST9TcywHKDeq+1Ktb2eA+v/m/SsDB24sdO3STtERpqPeXfiTdGtSrVp+CJNUh+b+ls
         XoJ6gePheBFJ7BDKPk1rQNYyQZIpnGtySNrDn7qKbzkSXBe9aOdVj+XJ1mx6EAmMP4cg
         zUxeKga2cZR2NMVcZ3IL2eyakLWREz3iLVJ6Pj5Bv+jhomH4FIUcbVkqvJgmj/aCYFit
         5SLGCPtyNIYfkGvSpXnXaoaldFa8jzbCgyBwscfe65kN7DERAOJn5rqrshxtuZiotanO
         XlRDB2vODBcEmUQ+UNsiJU7K8fN/8P5kio6h36TyVXM1Cqq2DZRCvu/AU5u+Ke56SV2Y
         swIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756994; x=1796361794;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EAGgXcLUFrPzdFT+vediXnDt2ttji9J/V8iM8d9PPz4=;
        b=aiX0C3sHOIz+Uo7LBSPtPgpGHvmVVbIExJ5WQM6/B/AUKKrNc9iK5B7LVjz5upjGoE
         KXb3FxJrRSpnlNsb7kXzyLHK1Iuk6Uenn1VmknX3gx4MnCI8AZ+7qiRXz67Jn7Pr0gvl
         AvS5EYI/r1QeppFNnUTlOwyLFCua8tF50q9dZSYWlqPaH1+Vb5bDwhbEds3Xsevj8fCB
         +l8fHMbUVtwtVmIMA5FIClWD8GPXnoTpUVzfHUt5TQyvl874WNcX1hTxixH3THaaHkhl
         Rm03DdYyfvzRWOOOo2N5p95b+Ao8QgP0v0OyB6LPAXfIyLJ1ganSsg3jyNjUxNYP6oU+
         vOtg==
X-Gm-Message-State: APuU4Z8sV9qaSbUl6OSOf4sMLz4Sn5QBasdMvW/NcPcE4z7YYd6L2rX+
	21XZRQwGcQPz7GseIruNNuCJIvTJc0OkdcfzLSdG4QUi/oKL67NhDgvc4wj9Bcuor8t95ge7n4K
	NlA1zBcvZ1A5mYxzIVZLEwA5gDirGPxod3raZW6w7wuzvQBwQOuDsTU/+oBQ2VM5C9jiO
X-Gm-Gg: AZFdTZfAkQ0XpUGRguvL0Hm+MzzkRWoDjTJAVz5YrnK6G6FiwdB3vxTUH6I/kcxUGft
	6nIARIRrx1wTxHrYjqVusREAjYxN3QhbYGieebxt0Flu4E+fJu/MU3nU9Pkd5XnmbwoJHq/Task
	sSTmunA5pU9vMck4735FhTo/BrmQ3uRZqvHGcw1zJ6IfO/Ug4ltfepptxZ445NtPvkmTiTm9V+P
	brsRJ1a7CF12IirEEwugB7n8R6RBUTVovoczAJLf1qgHIV2DxXqvHsbblQm5QNnh/x91C2rdxi0
	R0/sjTMu89bqabwCXj/7mIvJLVhXeLGxlXshcyqnkY+YdVd07/kvUWkrCtvD9zppGtqe/LPUt6r
	IAt0OA38DNNNa+6s42Zk9Bn6C+WkJhUOPTGqJJivvGDHlmCLywtEu1wzC3Uqf7bfDi0/FrvjzQr
	z6gB3l1ewqFPO8e4jKYHJZ13bz9mxmQrTCrhQJvH4IMGGNS/RYdqhk1u2VcsmyuOXMaIPCN/pQs
	49n3fw+ptGhgdmlD8/Z3+MpQ0T8
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr36632102a91.2.1795756993823;
        Thu, 26 Nov 2026 21:23:13 -0800 (PST)
X-Received: by 2002:a17:90b:3d8d:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3b41c80b970mr36632065a91.2.1795756993296;
        Thu, 26 Nov 2026 21:23:13 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:12 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable DisplayPort over USB Type-C on Qualcomm
 Eliza EVK
Date: Fri, 27 Nov 2026 10:52:59 +0530
Message-Id: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALMTCWsC/32NUQ6CMBBEr0L6bQnd2IJ+eQ9DSEMX2QgUu9qIh
 LtbOYA/k7xJ5s0qGAMhi3O2ioCRmPyUAA6ZaHs73VCSSyygAKMUaIkDfWyD8d444nmwi1RQadu
 5wsARRdrNATt6785rnbgnfvqw7BdR/dp/tqikkmVltXHdqbRgLp45f7zs0PpxzFOIetu2L9rl4
 Ru5AAAA
X-Change-ID: 20261125-eliza_evk_display-1285afd0624e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=1478;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=jOB9ZaPxV2ojh2yhuVh2IcgiDE59d5e+lxYsxG09L/E=;
 b=4LOLxl0vTdCdDcjNUzPZ6hF225Qv6qmwXN8izFm7tMvFRvnudXnNo08C/zXwOU0CSxF3jgnTT
 zv3djEtBoxVDK7PuhMGdIswqO8Np9FiqrzwGdgWrPAOpP49UbbkJr+k
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX5vSIYYm0HEDV
 +4ULVyc1+AsAWSJMbHh/6FMwZAi1bQKhycW70CIKD5n1aDh9tWD5Rs0fvC3Mpad1mHPWt9MhCob
 Hk6HINUUccDEZg7r+KN4B3pK4tCbO78=
X-Proofpoint-GUID: NzTmUBW63_AzhCVn2OzjwPkPgProhaWw
X-Proofpoint-ORIG-GUID: NzTmUBW63_AzhCVn2OzjwPkPgProhaWw
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b0913c2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gqg12Ns95l8UnY95JVAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX2zpWKAs9c8fg
 ziJrRZFZofc/AJYnC//sbztahMZN4ameV15ClG2cJidx4RfRznA6a7n2dmeyLqqCdO3rZuBU740
 35cRO1Vh88U2mI/3UYdXFzQMEQB0v3I0yIOw4ovYrH8V6vUKmK+NvSBwOTel9pZkQaWgnOJcb3D
 amCXPZ1/B/dBjIc1F4VSSgkBgRNpSO2uKiiWvBY4qGi5bVanD6Y8K8OmT8ZrWgSCUq5O+WZuVVw
 gfNYrTEbxRHdhy4i5q6tdsGIEo1cQEuyNkHfoHzwlJa22SafO35BSsbAOj6hmaphlhNlqmkabHB
 2sWUiXYKTapXUpTMQ2n9VA0dH/uEyYoUCKN7NvPSnCcQ+YLspg+FlA5QIjr+8YTp94L0CH46Ch2
 qIX21hwOrlWFw6FVXGBOROvflMOOY/dTqbNUw4oSCqAeRr0q9yDHEmCsVsZ/XkfPOvrrzCr+BK6
 wDn8HfxhEkj61FDwlrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270021

Qualcomm Eliza EVK routes DisplayPort 0 to its USB Type-C connector
through pmic_glink. The board also uses an onsemi FSUSB43L10X
GPIO-controlled SBU mux to route the DP AUX pair according to the cable
orientation.

Add optional vcc regulator handling to the gpio-sbu-mux driver so boards
that provide a vcc-supply can power the SBU mux during probe, while
keeping existing boards without such a supply working as before. Then
enable MDSS and DP0 on Qualcomm Eliza EVK and describe the SBU mux path
needed for DisplayPort alt mode.

Tested with a DisplayPort sink on the Type-C port in both cable
orientations.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Add gpio-sbu-mux support for an optional vcc regulator.
- making it 2 patch series for driver vcc support and Eliza EVK DT enablement for DP over Type-C.
- Link to v1: https://lore.kernel.org/r/20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com

---
Vishnu Saini (2):
      arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB Type-C
      usb: typec: mux: gpio-sbu: Enable optional vcc supply

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 49 +++++++++++++++++++++++++++++++++
 drivers/usb/typec/mux/gpio-sbu-mux.c    |  6 ++++
 2 files changed, 55 insertions(+)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-eliza_evk_display-1285afd0624e

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

