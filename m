Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495766;
	b=yikAYPOhPN9qsl12ENn8hBSWULdXdfqVzJ75SYnOOSu5dqumtTHiczHaJ6VWK7Okrv+p
	 naAzAiG+UWoPFgYqxVSJmazkNBkBJVKsuZTJC9QbRck5D0RhY1jSYJvaoGB0npKvGjY7X
	 qJDs9X3CB9XoFJmGLa177UupcxVAxZ5CplyhKp7JiAlRTK4yw1eVMk6GuavVkC9dVuVjP
	 KWuysRY1ElJVtuJ1SPbj0HVIQUfmp+Drlxj6ytI+ifiPXh6Oqt0QsSP0fKDEP+eX25bq/
	 PQQyTOqoammVciHtU8uu5/2OIl6jklBNfGdxNfjAkR0t882rnRRCRScVQpE2Jsavivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O36e3BTqEKtoNvH+7wELePth3zZkQjYEsXxTSfuW3pY=;
	b=1OwE8swar8C99Wa/7N9sYnqeb7UKHdQ0kRf8RSOFXo4+4/9k/u7qgqlWB9+SUyLmS6Qz
	 EXZ93fvZtiy6iTvThUv+TqbvqjsGKpDe983Lc0wfo5RJDkONt9GdS5ZTli+xMqg3+UPkG
	 K/ohic5O8pCPvlxWGswhmkj3+UlRV2DzuGxFthyLR/IqrXPC4Y5Tqg9If3Y37dcAaDPvR
	 CpM2GbwKXJeOqT/A7KL0nQyRSvs3e2H/rl5hBdgP5aXs23M97iO97REj40He4Sdldxs/8
	 z+0nOisYHYFUbFu79qI/H6IAwnVxgPJplfOzVKpLHAYez5QDx6w4m5nkoAbKHXY6aSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9we18Ui;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bk+iwTx4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0856D606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0856D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9we18Ui;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bk+iwTx4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBJsLA442006
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O36e3BTqEKtoNvH+7wELePth3zZkQjYEsXxTSfuW3pY=; b=V9we18Ui+cmJabrm
	TeUsyZPb0frxi+GHRZX7LM35iGo920e+AFQdomQgrOjeOdRqxDb51Eyb9PVOvVdo
	cXbFzlsF2q1Ak03zYO4NQsDhbxKDtBvtUF4fA0s1PjJ1JyI95tgnItF2rHlBoAFx
	uINN0Ey1Bydi1qSCTK9SAzzHY5e/qKzdaMi01zzBicxeWkks45nEn1PRE3Nem/lU
	UBK+mDSx+7Wy8kO09m3mHsmQ7g3fO6oOjat24B24PKXseqbGg4Hi3/1fwZdq0tAx
	coe+RakTXF7NgUc8FOunidLa7mdmPfWkGa4nY0LceQGprtDUcf3P/IhTitzPaHoH
	oOHyHg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1yxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:02:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacc615f73so4649795e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495764; x=1795100564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O36e3BTqEKtoNvH+7wELePth3zZkQjYEsXxTSfuW3pY=;
        b=Bk+iwTx44JwVkpMM7bkb0Ahn3ffV9Pp/QPq3iZEigWUUMEsSepjyJ7teTOSjQbopFm
         ZrBhoiR6OvkU0QPYNlBxgLzFkB5mGK8w9e7AD8ZnBl2WfFXe6vdpJFORac9/yscjDFNY
         Q9+rBayx2tpOLWOWVTXa+AvBxu0Ns+DBcWNB35hTGnpSqGJRXc1inRGxvj9qO/jNYvR0
         84TUwPXruxBmmxBHz10Yeb9MERcL5AfBnxGbqlCHtK0NsYiSjMMbQ31Qrwn12ht6PSJQ
         TkKGRf8MclHuMMMsgvSpUavZjIe8WHl9yk4g7b0q66DfnStr3EjqbdMZHrbgL9tXSfWk
         oW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495764; x=1795100564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O36e3BTqEKtoNvH+7wELePth3zZkQjYEsXxTSfuW3pY=;
        b=br2e7Fzf+4AVHsz2T/dvKFUiXkbdgvyCQ3c9AQQl3xP67xY4oXCKNuR0YLSNjIGp8v
         /ZzT5eMAp8BRB/SIokMYIrWuyyCskhDYSDVS1FlpHLoVeUdM28P8WDPtQWySdTIIF1nF
         kLWc0RG5DAWzt95EsO0zk1sl/ctLMxX+NE2GCQIJ2lAZWIdLHamtgURmxd8Qr7/c7WoL
         YLtwV55qFjzgIYLoXkU389mBCcHAD6hOy+MudoBHITtrgmB22Ze5d3my1fMM0E+gkCAs
         hfIEEWxu7s2H+Hwc62dP8ki7/jMsL/diGGbG+luaWoQIvtHGVDHwqpq1zbyrs5IJGxUB
         qJ6g==
X-Gm-Message-State: APuU4Z+V69UtP49/jpxS7FX7VZ6Yy2YRAyn8xESrYJYbgOWJATjXtZIc
	Stcd6i2PvzqiW5w0IXVx0naMkwMwd6YEqcVF7SVoD79+3kdQvw+VLqSa0ivBSV8Sa+YeWXd39vL
	So47CbA9iCx7QGJiWLJJvNBTuEmQ11dO7P6qLOp9SclXFDShxmcRYwareAcD2yAnmRUlK
X-Gm-Gg: AYBFou3BQFvOMcltnIrATZsb3pzYS/aZMvEVmLPNMld6yvHxOqNtAgEWR0+l2i55hwA
	4NY1F2zxM/+b2IK+x3LE66+njbL/Qd0vkRIpQOqhK9uDkXhNZr25Gtoe5XgINZGgw66onLCuda3
	hjja/9xu6reXMmhh9qoG9VWJyzgMyocukKyiLF1iG0rjv8uh7meAL4c7DuSTZyIpS6NW23e8AVE
	aQunl/5htj5zY1qcm4iIFPhAaF8ocLOU//cXOe9fpvQ/DAemSfRqPu6czj0C5GG/cp6IHMmHDZP
	EvbTxfGEh3hSXCN576DQnp0nVfKnJGUbBi965QY6zr7ixXEG61+fywaF6vPE8vY52J9RG56mFxm
	pCrFespym5VarDPTgwmqTtk2ncPmtq7FsDaVxjzxGtp6XO/ityhJ0sdkwWrJSl1HljvYJBw==
X-Received: by 2002:a05:6122:8b13:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ee1c43762fmr2729275e0c.13.1794495752787;
        Thu, 12 Nov 2026 07:02:32 -0800 (PST)
X-Received: by 2002:a05:6122:8b13:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ee1c43762fmr2728392e0c.13.1794495745387;
        Thu, 12 Nov 2026 07:02:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:02:04 +0100
Subject: [PATCH v3 3/3] dt-bindings: display/msm: Require DSI graph
 endpoint
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
Message-Id: <20261112-display-msm-of-graph-v3-3-7fd0c06ec6df@oss.qualcomm.com>
References: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
In-Reply-To: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21078;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NL0plrh7w2HxOlnYr/tSIGos13UC6nNPIfZjpVBqr1A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTxOkmvi8DZsUvamVPuodtZ40kQMaQwMY7xN
 sPW0I+aP6eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU8QAKCRDBN2bmhouD
 17X1D/0Xawb8XA4618T6HnC5GHXNGKUP7FSUK4R0ozv2+HjtqrJ7P/okCAVmsyILkeyMo0rQylZ
 yKIkXHqzta1Nk9j3G788pWVXkewrlAE8Z7X+25ud8lKE5Coh+1FOOnVXVrUYbQFQyBpJKdJBWGg
 0Wt6HT/5eMLMB2hYV02kqu3XPwjj4UnPPUbgY06IiAREsPnp1BQV5xXvz4PIbWUsYwufLADbUPA
 yXScZ6kIb7Eaua+c71HMu+sN0IBmN39OuDlFHdBs4agoF4a5dGgSg/s3kPxVG98fVjLpOZCqWfl
 HSp+YAXJL8ppPHUYtAS1rKSC6m1qh0cMJwpTDp2y9uNs0W1JvYOfObfANHajDVv6D0iWWABl2Qm
 GWh1IqcWBzHfwkf9nqObxxezJcjWrg2uoLTaLm+qgqgdfPcgAGtx9eZN/axu1FUD0J4813laAXN
 G6JqSp5jFa5gMNtqP3tNj5cTSp5BcDKpS+gzYnCaUmawoWF9JxZdJtyMPifnSVtvCNLGhaORRtq
 yu1IfRdndTeHFMYqXYpl3wQW61YzirKIaDmKfM3O6t5pztWl3Vp3lMtfSEiUhgDVawAQuFWhMJd
 /u4pPJ3+QXhD6wNm8hJsXukINXtBti7aHkWiH/gRyKSf0ojfqKvzYwvkDS0tRfD0dwfbIWsUK3h
 9DbliXmI73gvPwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: al9yLYf4Oo5S3it9o74tCvd4fHLvX_8m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX8Ykn1wca5Ler
 ys/z1vr6sXrQV5vfiSyzkn0YBBS15L9GXtP4jVRTAE2324CsHUqRFUIgQXf1cwsBMemXaCntfFT
 sSGqvci5sBqWtiYw0qG/cMCzlPOCkT8=
X-Proofpoint-GUID: al9yLYf4Oo5S3it9o74tCvd4fHLvX_8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX0oIKzm7Uyvzf
 3vsezzXI7L3uiTQhSe0TtE5ueYBcrFbOeZYqqYRy7dqUIodceOetatv+7KzZzlF2SktNLgRMGxM
 KhmotYThC9Av9fjw497FiOOk7FvWn/9WvCUaOEBM3Ff2+AnVkrcUqNM8N1XHQRlvE+KcHuVqNjO
 EjhiDSBb5CEuRYtytjYyO9XCpLjIYrMx2ECgW4lQGpUG8/IuEmh2WIL809xOxqKkzog+QkR/Ve8
 74fjS4gZV9FXIFh1Irc6dFmoOYnM9z5A9V4PLyqEhP3R5QSGcztFwTmMvyvh9k5bs6BkC56lX+C
 SZeSn8uuD7EyXnhDNsbHKne+z79ze3zM8S5QVNa/DZVwVKXme82sl6UVuqOhnf30BM6EmI4jwwd
 HHj56sAbND9rQOriU7ocVdqPNbP4Nr+u7tHRoShw/NlrgrYs/5R+wvX9tIXTRV30AmlHfnSyvi5
 8r7u9MYF6ESFA/XU0IQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5d515 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cjt56oMJJs6jdj95yyUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120059

Technically, DSI controllers do not need OF graphs with endpoint to the
panel and could rely directly on their child node (when panel is the
child of DSI).

However Linux Qualcomm MSM DRM DSI driver never implemented such
approach and it requires a valid graph endpoint pointing to the panel.
If it is missing, the drivers will silently accept such DTS in
dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
of lanes is not initialized.  The number of lanes is initialized to safe
default only when there is a valid endpoint which is missing data-lanes.

Extend the bindings to validate existing DTS to match expected ABI.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Please apply after Qualcomm Soc takes DTS changes to next.
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 25 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e4fd1cbbd4e0..e9446a333fa1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -201,6 +201,12 @@ properties:
                   - timer3
                   - timer4
 
+            required:
+              - remote-endpoint
+
+        required:
+          - endpoint
+
     required:
       - port@0
       - port@1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
index 7010ffa0ae35..8b9f54f189e8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
@@ -241,6 +241,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index 2d9edab5a30d..dafe5c5d4b75 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -181,6 +181,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -251,6 +252,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 49a7b5c4c678..60ba466382b8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -194,6 +194,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index 287cce4dbddc..c00c4d5dd918 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -235,7 +235,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi0_out: endpoint { };
+                    mdss0_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                    };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index b68e7efbc189..48dd897d5d5b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -258,7 +258,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi0_out: endpoint { };
+                    mdss0_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                    };
                 };
             };
 
@@ -335,7 +337,9 @@ examples:
 
                 port@1 {
                     reg = <1>;
-                    mdss0_dsi1_out: endpoint { };
+                    mdss0_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
+                    };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index fb3d24bbac7d..3e4a25a217cc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -326,6 +326,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -418,6 +419,7 @@ examples:
                     reg = <1>;
 
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..16ebd5d701d0 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -206,6 +206,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index b643d3adf669..9f84ba248a83 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -230,6 +230,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
index 00e82bdbbcc7..7e653552fdfe 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml
@@ -242,6 +242,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -333,6 +334,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
index 7dc269322b8e..4430baecfd99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
@@ -196,6 +196,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -266,6 +267,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 6e8b69e5ec62..1330a5f80e3b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -192,6 +192,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -262,6 +263,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 309de1953c88..2993fc1eafe6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -179,6 +179,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
index 3deb9dc81c9c..a942a479a440 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
@@ -194,6 +194,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 46e9335f849f..62920c8fba0c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -221,6 +221,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
index bba666bdffe5..faafc451633c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
@@ -201,6 +201,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
index e22b4c433fd0..46a8539308c8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
@@ -193,6 +193,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 9b0621d88d50..5ae181bc4fbf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -263,6 +263,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -355,6 +356,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     mdss_dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index e6dc5494baee..7edf4ee9e52d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -231,6 +231,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -321,6 +322,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 51368cda7b2f..bce5ab069324 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -234,6 +234,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -324,6 +325,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index f5acf528d0e4..b9087a06198c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -236,6 +236,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 747a2e9665f4..800144f1c7e2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -243,6 +243,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -338,6 +339,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 59192c59ddb9..977c2fb1595c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -239,6 +239,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -328,6 +329,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 0f7f79527748..05cc2f9753ce 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -227,6 +227,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
                     };
                 };
             };
@@ -316,6 +317,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     dsi1_out: endpoint {
+                        remote-endpoint = <&panel1_in>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 46dc0d28da29..0a8010f4d9d5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -364,6 +364,7 @@ examples:
                         reg = <1>;
 
                         mdss_dsi1_out: endpoint {
+                            remote-endpoint = <&panel1_in>;
                         };
                     };
                 };

-- 
2.53.0

