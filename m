Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688496;
	b=QPWdZodWBmVvWCl/JnTAXECq+JMIiX/wP6ZppOo7EbhMeYtS1fjcGopTIU7TfsGmzIAl
	 0vyeREH4+CkHuy6xy1WKJmt/xV+rCjKlI8cmtHFokp7+dzTmCkkIiosXjk7oSavr0v9QE
	 6krIeUnYS6E6ThAAoF3bYmcYBOYa4k7leQ61jAsKRxxGKz69g09VOO6DEhG+vKmGNkuGB
	 zlFarb7Oyi1U11Eu6Pj2nLcD8OY5hScs+pUjL3OgDeJFXE2rj648iTCcsnkceGmH98Do0
	 LKtQjhqQSNBETW+hZF1YmBGlhL3xMm4n1X6ZY1QnQuXIGCqlXIbAafGXgGYwGZ2vk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
	b=jSfDaB4J1NrE+GdmurXhKV47F6EUrcr2n6is5mFV2zRKnwUKGX971duYNoEDGl6wtF81
	 3POFBwQVnFc1gOj3ex2ej47oAl/3H3Bk6o7aSkqivqtcSHoLBbgO0jV65zNWmJudIV66d
	 KLiqClyl4JPc58O17jWPZFuZWeOzBX5XLIzWA8XTxNibpNi0uo3AvxHIZVT2KygTOmTvY
	 368DeiwyAU2a4IQ//fpk3raBVFUW/aXKSQcsvXucNFesnY5LVEdYOxQZeuL1qPEw1BhA+
	 U1yP/FXyXqrCER7YQ5Ab2CGbSlTrXkdLrS3ZwSWdTIsfNTOnhBnGQ2XlVgY0Jqgn+HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hSLg+Y+X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqbKcuaU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A544606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A544606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hSLg+Y+X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqbKcuaU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwNv2175589
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=; b=hSLg+Y+XgJqDjPUZ
	yRLujwQbzavYYO74euLdbimeyrrtMmaPEge5C2jEogzJfeElbRDYlkfFvTzRRjdA
	O2M3pwzmNrwqKrxt5xRV/COde9S9QlPWwv/k+1ZrEwiaPImxKHUxC5g3ZcEe/yOy
	8OPhh79OQ3TnS5hDpfg1YsBpjfJuWTLZSJYSmDoMQtDAOgUrHd6FzMCjurBa46Fj
	iqaMGVf/KMHOc4IJe9tHCCzjkKDy1zq9+yF0pg/PeQ7DU/J7E2xZWg2gsOaBGhRZ
	C3s9uA9iNJbFzK3TV/iOPLmOCiL/KJhmc5ch6G1e/Jyx/Ku8WYVcwkFs+tLiP8Bp
	cqDjjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuywk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94975041698so1628979085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688494; x=1796293294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
        b=CqbKcuaU9qjpK9HJKQ2eXFJWrsO8gzCnw5iA427aqQpk1rjggLv0PvDnjoYOb9JMdi
         8qriXUvjZ2yD/2AJ990n74r7np+Wr9y5aseJKYSvQOBjAKn/f8d63Hi3D9/sX5UMbD8o
         jFNd7kyWcjQ8+yEx1nqa1PPhTWf1EXOWXYzPD5WOMk/b0hIuegIeUUc5c5K+wbhpX4ab
         HH4s3W68jEZQCJ2jWSiNtg79Q7thlSu2EiEudWpcjhWpHT08aJjVlYZ4322eB9TyjO0W
         FA9xMFKkMcb2oD9+MVEP16ZjsysSM5bAQqM6FOj+mwUmT6htjypbc3kZ69hnWgL9KA8v
         TXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688494; x=1796293294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1JzkiNl7YNzwP7sWiCSPLTf479oshNyyW9/xDePo9w=;
        b=XlBHQCzyTBZLCicsaAMMuT+pEAsUMCJsB0wIbWAL/h7+OOeL2gVm/PiV6qNlCRXdsm
         miO7W6yh5SNb/Jyujlyg2abSRbwVQ4g4ipyGhGkbhMW1tBxLlJ0EzV399DJwm/+l7t5P
         Au76gdJh4HYg+UDmD52GOu4QVtBPNRE8WcjQa6WiJLV9LHfhT/Jj43SLaGWV9ChHmV2k
         ryVqeJBMY/ydyixwNubKgadZZFVlhS1HEHs+DFQV2GhQ0xundW4K0mGHPD4xAAVBcp18
         QQudup/0o7OiaNMzyZ32IzwIYiqNRj7EzOYsHHmVP8yBpgfMU4avAyBdUmMrMDmju9qS
         0FPg==
X-Gm-Message-State: APuU4Z/ERSk7ZllJKwD1TWLMDaeS6tqiz/QqlZkTmnjTz9sMdQXophpr
	9vCnQTq58tJPjmsbHXTKwaYq1J4luXnQk7C4l0q+Ox5mjz9li39Ev6Ltt56WfzCn5hecp3JLF3D
	G21D58vnaRoQ1loLux5O1Np4C5ofj6Y1K5Yrv715s/syIjXdBvY3T26CJdS0lsB84hpk5
X-Gm-Gg: AZFdTZeVOj8UTD7t590uEdlwFKIrWsFeeLWLQp5tii1Q97FEupNW4PvGxQ3JcLvtabq
	Ejj125+uB4Vs1toFQnU9ZH2QGUelbuYHnj7Yy2axrJ+aVfD8OW8+Wv00DziWavnzj9TuU5nYn+l
	hGGaASYVskO+dGWhXVED2elF6ZcVspKDfgLy2pEcdrXz1ZAOcIOP3GHPxbCqymMirn7e8o8jLtZ
	TMeNpW1ZnO4ABdK8ChypFYcPKpAOevfBIMwpQwvaCxfyKQPtrwOnd9npzyNcg4Cchi8dWFVC4M3
	EVHvhTJ/OIPrmse7FW0E8WCrarFCf0g07SNOyF0E0nY6odQtuMSA1vSF7PUilTl24PEWu3WLN9g
	irBFpn4TvNVOv8X34mpnlBNeOdpVAhH+yRGzFhX7FiNJUHMYiJ0XqJLkZ0WtaKIwE8FBge0kxiU
	U+dDiDrdkyY8k+VkCXw/VuzgvzJP4NoJvmwmmKKsx0Ld043uOnuGwMajxRl9+HC9k=
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3660774785a.3.1795688494580;
        Thu, 26 Nov 2026 02:21:34 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3660772785a.3.1795688494138;
        Thu, 26 Nov 2026 02:21:34 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:13 +0100
Subject: [PATCH v2 09/11] dt-bindings: pinctrl: qcom,sm6115-tlmm: add the
 egpio function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-9-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=e9gjgqmVN35E5q0f7mN/S2W0FHM2q0sIPfb/NwIZsDY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUMf9wAz3+gAYQ4L+1woh512FKHLaK/5WlU
 gQxjs4MeRuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w4tfEAC2OmBzTNpcwCg0T3PcYTt4Y31jc2RW3ocrqYHLNzjb1D+6lwpvptIwnvhwoHLxFiUvovH
 gBxZtowt9Kji9tvcxrNVSe9vGLJxnXWEz7mc+1sHxh8+v+kWpXOLTsYKLKtrshjnAwWbs8cztyt
 zBVXnVWqT9JQtcgpChy9VyPH6eppanW6FOjcn/EJ5CoicdRED2pjO4Ttq9H7tI9hltcrZNVXVX+
 wc/XS1s3I7oeflzyqzDia/0qZsjeY1hDVpnmME9cvuzKWWPDfqevcNf67o6Ml2avc61gCtwP11S
 NRJZrq0KQ3v5Si37e6rZYthJhmhuDd2NmWvL55dZJOnRVuHu9S6/r4Ko57A8dayJlB/hJda9PsT
 B9/mT7PcjynQdm2Nw0bCHQKONFbqPuoCEM8JKhW6aXbp5NrP0bdyxx0pYQrWOpbfwV+RcK/8YRs
 O6E2REScmXME5QPzhBSZYW0+TS7pWgUUYzHfKvC5rpn3dDYbGi7t55zqizkc03hz/9QUjWi6FO0
 pVEXCgA8XNssfgD748VYjIceGEV9PkdYht/1vIfoyjdY+TpD4DE5JTp3wTKQZScg811WpuvfZHt
 lwlJ1nXEq11YqbAHD+r6pOiSfGIafuxEfVQ4k3fh94AuC0inaIyt52krccxe7pxP+M8coQeS27O
 /PunhGBAUwW915Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: SyNHBd0RRel6CO-1WKN_60SVyUKN7mJa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX4mU7v7EmXLyr
 XapbnmOMowze1TNkz3v4hiPEF1KB67hZ4ZcQ43iSWB1GbN3nTbTtGFpV0fFtbZIGeySPj3kvGez
 BrlDMfIvJleMT3iD/WT43HcEml8z0QY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXx0uxdEloC0gc
 47ZXUgVvAl06btYfhBrn0oy1t5tKxQJfvfyFYlcWLSe0HJOWUTeGjMoL+8BNSYRbohQHjqo9OVa
 MRSiEStZFZGa4JCOm115huCxXMWUkqWeQzobXGYUO7Lix8Wcef4qCeN5l5tvu6XysIbaVoHtYM2
 PVMY4418CZX3k5doMEFIifbCZBUB5ktWZDuZsbDS/P4ZcV/RF47VWYY8KgfZ3/77KMHcC9IUWCU
 wzEe1HkHl0U0vFVJClyiSDxrgm0Na62EZGDj6ZO8I76PpKVTNWDBJQjLDaveIaA3MvbsD4+G78O
 9VacYpaE8byfXNUq83o6WmUV+Ty7Liucy5kP3IRXkX3b1IZaa2HBqphPJrkxkif5rirfksNNpnG
 67ugaAT2AWLtvjfiabOMrxehkHDFk18V0EZIN9aiGMMH/tH8d12US/OXgO2ZqgPIextj0gGkSMc
 wOdsqhRtXzmh4+mwmeQ==
X-Proofpoint-ORIG-GUID: SyNHBd0RRel6CO-1WKN_60SVyUKN7mJa
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08082f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qcRaLMgUlmIIbR5VUokA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The sm6115 TLMM controller supports the egpio function but it's missing
from the binding. Add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
index 7f36f9b933330937ef9d7b334b041174f9617ec6..0b0ae54c0cc60275b914f4a2e4748e0e339e6ca3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
@@ -69,8 +69,8 @@ $defs:
 
         enum: [ adsp_ext, agera_pll, atest, cam_mclk, cci_async, cci_i2c,
                 cci_timer, cri_trng, dac_calib, dbg_out, ddr_bist, ddr_pxi0,
-                ddr_pxi1, ddr_pxi2, ddr_pxi3, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
-                gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
+                ddr_pxi1, ddr_pxi2, ddr_pxi3, egpio, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
                 mdp_vsync, mdp_vsync_out_0, mdp_vsync_out_1, mpm_pwr, mss_lte,
                 m_voc, nav_gpio, pa_indicator, pbs, pbs_out, phase_flag,
                 pll_bist, pll_bypassnl, pll_reset, prng_rosc, qdss_cti,

-- 
2.47.3

