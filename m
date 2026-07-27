Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7883C3F58
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182500; cv=none; b=s+kbdUgxp8rqfKf0JvQC5NB57k9Z1LGgBeXC1dTEweY23lFh135Bf7Zs+4jLv9TQ3YuRaV2q42U7qeIdx31zSvEmGm4IUt2Lb5kyeWMA9GSNh42Ywp1D0Qoawc/KG1kiDjsacGgQ53gmxYHqtP9E4fhwhwhQKcCtE50fgc1Q3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182500; c=relaxed/simple;
	bh=hNIyiUwZhOPYSatnJ4WkxiE+x8C03xK8Iquoy+0mzD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jX/n3K14ZIIRqqErywliOo+5NB4WLfVJEx2+1LTtzextvAgm9nRN2hxAp4k1EosQqIVbeoaR1n5newQu/ley1lX4SKLHSmBJtRPb1Rv1xelaHXVSTFJTqJypmFo+ZCHrsZOlVFKBBKtXKO7WbO51wXaJ/h0tLj3fipUguFPW24E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8fHIhdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5uXma/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8fHIhdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5uXma/L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC2hC309280
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5KY3nNq7DE64d+oeLOd4ZdfCdILMoIvJ2/3c96P1oo=; b=D8fHIhdNUQXdMLFR
	S32mEgzCvdLXLyZNXyyAEuU2ACKy4e1xNmgIqBei7zpgfvvIGJHSS3naiujgY4XV
	555fRVNOQXP2l4lRyP1hn8tp0xrGChzeECtzAE0FU1IP/QBH4BhYZ0CWMbKW86QC
	4+NGx2kbt3FIhwdlMi9Z4ZkamRVvU78p4XxYsNn/Z5JjmsFMCwrnWAL9vHeG8SsO
	txXZJRjzWB9QztY2+hg8GnoE50TcuNCJcqC/7XMjDpaFpvqYXUrSrkiQBUa2Vbtt
	Why9TfzzdL1xxMyL4fS0bsPrcW+z/3+UXVUKhlbPBSYKt1dxCu2nGbifLYbCmo9V
	tkoa4A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn88n9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:01:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfd13481easo611063e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785182494; x=1785787294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5KY3nNq7DE64d+oeLOd4ZdfCdILMoIvJ2/3c96P1oo=;
        b=X5uXma/L3ueKmNzl/xFmdE/Y0Ggz+YIxPxQA6FjLD6IvOTblQRYfB+T+W6s5u+GvH7
         JTNGp+BRByRfqaeB3rzyzoicVt7FlNJRMHg4zMPvXEL0h//7VtLSOt+PlpzFEl/4NWhw
         rF4VdGCsUv8/W8PmCUXSTUNaJMQOkfiKUkC9tPwqjwIyaLfRlMF98AgMOmioBK5XrZD7
         CB+YoCZwUooDP28C/WVXmgpLtuqoKFhNG0qxP7GVDw9cm0F94D+azTg3aJuVZJJiGQJx
         C67KOBysAg247VbLBnBM8JoQAnNGZZu7gso9UWFOo7bo6ynhmd/KKf+NRinrMUeOvmoI
         CABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182494; x=1785787294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5KY3nNq7DE64d+oeLOd4ZdfCdILMoIvJ2/3c96P1oo=;
        b=S4dcDsBjvAbzaXwe+AhNvF/zD3GeiwU88NCrVIl0QcZdu3v+63N+qafvJgqPtL7UYq
         IfjP9oWWrjmjQpCwh3W8GyYUa+BJutWu5UMZZL++UDlxBkodoJy0MMZL0SVerKCPZvfE
         Mu4sD9+/fxjbO5bvKa7q1lZ3/L/SntxynsOlGJndEjLzfjYoTFeuh9ekapCtpxs2lV94
         GkZrY6miKAWbYcNc3azPHrH1FDkFCdm8ixgdUPe82k8d2tbY24unTj1f11dMfRY9klde
         DLf0Tokvy0FPeFnjdkrauqhd+wy8lqG2qOdcvTabIaZwHSWYbWDmsEAkFKVdWwbTa5xU
         DW+A==
X-Forwarded-Encrypted: i=1; AHgh+RpeqUHJVXp5JHOHCzmdvMGanZix+0pAKu5tvcwtts4o+FgikFf/cbs2Xdudl+sZzFJSIQSQTRBtMS1tH7CP@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVWkFtaTZX3Opb86H1iMOi7jy8SWFeAavGo6saeQdC/iZXs5E
	SUTnCcbCqROrgHVl34z8hfcTKnVCZ23ClA6ROcHEmNGsN4eCbSxIzcBoml3zdhsg7HXM69vpFk/
	WBoHtlJEZetB1BGsyBnm4CqK1mn4WI3i0MBsu62AfMIZe98/4BGDQAuAb5eFMNlDJbg0VqT61Nh
	Dv
X-Gm-Gg: AR+sD10+SU8ZCTcIU88as+DFNSXeleROeMLww2x0jnEKOBC+6WQvw0iZtrXEuHgBgFu
	ydDGtgMYdEfiZYNdJZX4K0I6Wiov90zhJKbS8YUUEkQ246fAh8exzklN63CDr8kw+2WsGBmR2wU
	9sxPhVDi4W/4V0sUJd32C2Pd5MonnQDaInLtffrEJS8T/qFeii8SmlSnCYyFH+BJPcascv9UXkv
	0LWsbcL7vPKqKzAqPVqFwfUnNHUzo3JtqUxgy3qKteoHzXKQP693RaJm3NTyBrQO9rO2T+Qkcv9
	GobV/gkXcsCYX8oKenZg+Mm7BiJiAr3K+b4lRQIaFSl/FPUiIq+e77vG51kkvTvk5rmhaMQMkdJ
	67qjorf0F3eANf0lEc3i5t6Zc
X-Received: by 2002:a05:6102:5126:b0:745:78d4:4856 with SMTP id ada2fe7eead31-7503e472da2mr4840751137.7.1785182493579;
        Mon, 27 Jul 2026 13:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5126:b0:745:78d4:4856 with SMTP id ada2fe7eead31-7503e472da2mr4840719137.7.1785182493137;
        Mon, 27 Jul 2026 13:01:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a91ebsm17923935e9.3.2026.07.27.13.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:01:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:01:22 +0200
Subject: [PATCH v2 3/3] arm64: defconfig: Drop redundant Qualcomm irqchip
 entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-irqchip-qcom-defaults-v2-3-466f3c407937@oss.qualcomm.com>
References: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=740;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hNIyiUwZhOPYSatnJ4WkxiE+x8C03xK8Iquoy+0mzD8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ7kUHWTxPJMe9lvBG/AutofsxoRI4YPrwPhc0
 da85Eg7BwaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCame5FAAKCRDBN2bmhouD
 13f/D/48sdLv5gHwkRTtbl/+ySgyrQiC+n/4D7kaCvyppToOwjlNmGer+7cCTs77rvA4mB4WmKL
 pkicKX0QGQ634s6Z0Ne2CuxSD/RhbckBs5gC36u64GeloUzfyo8AvTP3vhyuputE9odGx125Fow
 StzsSMvl/iGAVD7fbVuGGPJ/wTNwLq2MAoCpu+eeyMBvqhTl9/z/ypTz+ggr+aHIDyWAMi6fNSQ
 R0gVf4thES2qrMFm61b6W0IvD+SET8Np9OmVx97TDe5WVAPTl1AzhZNX3vBmLL+1jhoS+SaKZ9c
 +IKWpVXeR6hC5b2pq84J5gqPwg60QpppkofK0uP66+kOOM8fWZxBMvi9lOHEyAg/0PgdF7CWTl7
 l2GUzNpzBjQrKSKaUS8pq5D1CU4FtnuWoyaoV4peFL55A+zm+VA+H3Q13lLZm4pOnMz1mZen2tq
 H+EViB/bPZyMvQUFM4Cu4tSk338F4czQO2gnD4IzUlXK+E4KZYjx82/zmq/HHbKaAcWvJZcWGGd
 7pxWV4p5ITKQX2XSMQ8nXMUb3ujbspnsMslcJfDxFWoH/3i7rLxLebFQHSg5AkTKQjmrdfW2yUd
 eXFxc+IAJQQ67dBfauJX3wcnHs5qIXcEum6OaDsVlpsfOckpQaTcN0V32ccZwcvQw0VKesHZDyl
 vZTHKVL/n9Dgfqg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4MCBTYWx0ZWRfX1rqvOQ185WSL
 cSWMf7/+cbn9Sy7ou7/TUT3k9Gu/ARRzZM/h6/Guz99YMdioFJ4UWHN3PrAH1bD0Zb5D/5ul4dp
 p4MecyYosb6Q8iCa4ts+9ECYy9OBLP8wuT1426syWou8Q6W7BclbEsy+e8hUkcnI7CpPKpIsHeJ
 AoqAIh96fZ+Re40TekbgSDkE+lU2Wr4+BrE4vtKdrW2HTkn5DH6Ch6Yx9dEBuCFxp3s84/SNuK5
 AKFYUi44mvAdjgKAZ1W/a4xaz5wtJqgTNhF9WEasHIWxydwbGXC/S4X6LkQ4JZ9rlLehwBhHkaf
 upCCsf2jTZLy42n0w+Jl2a22BDBYP2tuuPEoVdb28tnZnddYVoNmLQhon76JkB+FcvHGBxWbPjW
 ySyDQKZt9PQgr7fYvKAPTeXz3nIBJ0NrQ5gHI0248K8qymiotH59SkydfAXKWEBZ0Prac43n6dE
 bVkhbzCBJyj550hri1g==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a67b91e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cKvvBjE-lKIiJghTDE0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: US0poFchkJzHO2t2fxRDJKDqTmbVH0Qc
X-Proofpoint-GUID: US0poFchkJzHO2t2fxRDJKDqTmbVH0Qc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4MCBTYWx0ZWRfXxKLQnjTyechb
 2CAZ8mvOFqySVAdC9Kk4yOciO+7ucREPGmheXNL2N49VS/zndeja7B9QOT3cs1RZwEbcbxm5HVc
 YKWS1l5w3W170oiyUfy5CSsE65yrfMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270180

QCOM_PDC and QCOM_MPM are enabled by default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on previous patch - this can wait a cycle and go via Qualcomm
SoC tree later.
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..978e00891dca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1743,8 +1743,6 @@ CONFIG_PWM_VISCONTI=m
 CONFIG_PWM_XILINX=m
 CONFIG_SL28CPLD_INTC=y
 CONFIG_XILINX_INTC=y
-CONFIG_QCOM_PDC=y
-CONFIG_QCOM_MPM=y
 CONFIG_TI_SCI_INTR_IRQCHIP=y
 CONFIG_TI_SCI_INTA_IRQCHIP=y
 CONFIG_RESET_GPIO=m

-- 
2.53.0

