Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608298;
	b=oB/B6z5uEboAJnMIbNrY3PkwwJyeCGpCoTD4BFUElrsIHAxjrq71juxDFZTXsCVtpCl7
	 yITje36pLw9l0pYUCUoj2f3Yqay5JkIaTljsjpWe9xXiCAZMh/rmaPf68HhzBXlPeBVL1
	 pEQFvaki3K1hyqgJX3nTABxg5a+q7E2mXu/tANCRu/kpm9DkhO3gvDOTHPduTx/Nno+S3
	 JpsHq02WBiFSS7lQ5dcAKv8KQwUm+z5jM7y+Cx29yRWGOL8YlKBff0tpqbrkdgckmLhxB
	 IZf1rgnulAlPl4hJ7alsf+0b+Hz1+oGgnZkuTghZYc0sKHtbeYurzVPMrTJD0K07swA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
	b=yoAAD8/9VxsSFjKVuZB6Hm1srsH0aY8C1e+z2RDZQdR4sdmE6UFoh/BijlZjCxHF5nQT
	 7LdZwTV1tnVK3QM+bk3zbsF1h3WzUnMyoC2OmUZtagSczAiL1G8p8zpAL65N4MXhtpkYm
	 bkC4CQQOIJB/ToP5Lp43uwtI4T4u+bG8AvlQI9hJr9FHrIRvmjHRn3auQ1X2RcQG1rjfV
	 NTQZ3wov7Dhr2ugb52BxvAxCbR7nuenA5mlcBe3FT6P/jcibsQHp9FI4scvAylHfVk4x0
	 n/a2O3eSQ6gFRREb/wJg4PJvzNIT5qSJfRNoEFUhp2Gil5QqqWr6UuPAb/QnUYOe1fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UH5DTolj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmaJdOPf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB47A60A2607
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB47A60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UH5DTolj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmaJdOPf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DE272433263
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=; b=UH5DTolj19deutIT
	zqV014fRre0CTOATsmQMidOF+cXwsQAUpJLZyWL3MMotWOYCfN2GfteVrwCBENLn
	IcueiJ/blXe5WsJ+yJmHS0dtO0x3e+CWP5T05BiyUA3jJt8hX6lxrGCfm3MsEBbn
	2OooUqEidWZMeSdIr/f7dMDHNOUmZuzKOm3REgfJ3bAxyHZtWpCp+PopXmDooozC
	BIkvlLelEZhEtJA/dFt3B1NB92KIBU3x5TfvMCrR863VSbgi6CFZyFhn+HxNEe9W
	6s6LvuhSBwYD6FQXS1H/CWE/NKetkc9b4CkhG60DRS0/ipQ8J+sgZnSxEH+tMI9F
	/w3xug==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60uxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:31:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso848845b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608296; x=1794213096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=KmaJdOPfAhZvEObh1AKcHgUdQBIMGTiVbWs3AGO9qNaisNzlhajryhaseCbQWOyGWi
         v6Kq2sAJ4EayAygfasSgh3yd3dth3MfpImmbCkxhCBBhdO8yWtg8UKd84GHWQSMysaD1
         iwFjCm0AiID00xpUPy+djWE+7Pgn2O2HW8ZSEHjB4j4Js9l5KJQIJoxiD2v4D6TEWfA9
         8H5/xIsZ9np0oK2hbidfbSO/x5/jY7Jq5Ftf/bMYEXofhg0yAxrH1vH6gRrmVABxW1GM
         T5FeXe80vgFKNsAwFa6cjZWgqgAUPbqoAY3nCBlN+JDBAlxryhqqZKdYpStSv8qnTcBe
         E9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608296; x=1794213096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=h+2El5tXtbmxydSzt2ml3PnrTzGwHvrkDyjB71FetHXo2tRbgqudZOu37fqikxTltl
         psDRpcVmUNGPfM7I9g9C0NgVwfiqPZBn5qI7alA1yeIo8/Ep5qcJP83Cdmww7yFGSMFK
         cXcTODNZKbIrMHoNSUTq9M3i3heU+9eJVE7z9SdHNGJI+meE9a+oBsDxCt1GRF24zGFM
         6pZEZZ7he3fLEb7pvEVNRLH/S4mGmYMR8GqZAPuPnUY5OrOlCR8E21t+lY9jW3CP4/or
         a9CFR9FnvglNkZerpQoOCxd+230zXc0PH3zJ8TpVgx9aGpwEE0REFQU9B46JMaceLFKS
         Ti7g==
X-Gm-Message-State: APuU4Z+SQKzYqLi2RSTY4j5KuZiv+4+ZZ6wpZGfNXEMeTP3K5MQWkY4M
	ZOCt0GrTScUwGc9MkFyXkIsDtZ3IORddI5F3UFuU/RRXM0z2imv3AvmOEuSTYevK3FRLoOxZy31
	Ex47QJZrPg5VTFHxsfF2wAv46m+Y+kiz84rP+NQywpSdlmJ0qDxkpedlHqrbPG/Q3nLus
X-Gm-Gg: AYBFou0KBNch7SGDKGAXf9YqNdJbzOrFAIfo/k0ioZb1P4fXcGUJ2WDQKP95wKD7eTQ
	AGuDRm9cxoL+j8Ai/C87eNBzgbUnJa6T8Akf3ZCrLs0mZl/akoDFlENdMOA30vkY0Epxu4GdjZ0
	JoGnmshoFF0286vbVxAUl2PHLe8x/vttKvH23AeUb/VtCzAtSlwrr07vnmVxo0ArOaatAgAhd+Y
	CFWedbePJWRs+aAtbeYdKXhoInFz1yJHzie3cyVKFNabw4QqDL0hUgIoARNK5CAFcCnwDwb/erG
	/xJlXMc1WTrEB6wwwAp3fGf3WEJaunl0toz5pvPe40Gg7a1GKl80jPsnBdXt5Wg2+BwXKfWqtzb
	1ZoB8Pu0l1G44nFt+rq/JazXNgWDMpg4Dzqk+BcVD+l9/H8/dxY/5dnM5QNHhORAp6oNSOtA+KQ
	et1bOXmQ==
X-Received: by 2002:a05:6a00:1d84:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8a9c02be5e7mr7706606b3a.51.1793608295775;
        Mon, 02 Nov 2026 00:31:35 -0800 (PST)
X-Received: by 2002:a05:6a00:1d84:b0:880:7dad:3e5 with SMTP id d2e1a72fcca58-8a9c02be5e7mr7706584b3a.51.1793608295268;
        Mon, 02 Nov 2026 00:31:35 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:34 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:01:04 +0530
Subject: [PATCH v7 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
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
Message-Id: <20261102-dup-sessions-v7-3-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=1219;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=VMGzKTCz/azLzKyF9qh0sYFoOD2oiutFm8UHF1H6/Mk=;
 b=FTJZktJO19KaCxSo7At3dajbxHwj5iNmGTS7GVKlisRtVjNR01L481DINVU3y6D2KlWjucDwf
 sF+z9zbjT1jAXqJezx4r8sH7crhXH6OBi2c7G839kRPj5ew0dIvVtBO
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: aRWu8e2nVCJiWDOvGdcd-1PDQPDJyZr1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX4g2T5pmg4u+r
 zGBqeETZkkdx0R4Dy0WFsrDBmeir3VeCjiRCAXIKe8QCrxQXHirX+f46R5OSXavsJlN619r7092
 4I4cExpRNjAsJ8QJnCkX4ZBB+TWW9CM=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae84a68 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX1GlBR0yYfHi5
 BjTK1ea7OxhTJnm3y5OXXXr8vyAbCrO3mWYKitWtBQuQnWzgAwDu7tjOpe0F3U0livuiW414JXS
 bySDZOUJt/k3hcwk8kIIJckUr6iqHaX7YiChxebZKI73/1Yyz9crrUbRHai7gzH4qb+bz0/e2AG
 j0u1ekI6F13hCX03LmeXGJtWnFc92ag0H1xTbIpZPNlpM/eA2xvdXiSzwRmB327vbC5XJy5j1LQ
 KwOETT2Imz6mZj8H3nDxtKrlgbV64zVVRM/U0cccWTk3NI25oqlZKgyg9LVG69FOabarNoSnC/w
 VvTxCJjxuMd/kC9+oBoQ2zAJHoc1Kx6Pwyz+ZfgAdSPwOCv9+M5VhzsX7wh+TNCb3VEv7zsfv10
 cj8jysHVVXA0lL9BUihr4ZtUwgn07axdcGOR82JvgNSRio4Ogu4AEPIlWjNbjyzQnKXhhtIrpJ/
 KofBhB9MG6tkIeVKPIw==
X-Proofpoint-GUID: aRWu8e2nVCJiWDOvGdcd-1PDQPDJyZr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020033

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

