Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D735111A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677912; cv=none; b=YfdHv4reynaQlvbFwWIRpb5/w1667vvJI7/i80pBAECX2i98o3jDbizXjIiI6PIp0Whh1yyGluFdWV4FnI9dIiOk3S0JIkmq8vClw6jmiOUvVVojxaDsf4y4A0S7Z0dzh+D1BrvW4QhZZ+jqg8yFW7YW76ep++lBvpeJgUOFmjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677912; c=relaxed/simple;
	bh=IH5VHP8PlJx1l0p+Guv+UYdwTidwqn/CA/t4WgQLJ6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LdBRu2jAspRrzqYJ18vaSRvd7QNWD2Z+jOKz2dTcATm9xn7kukGlZAEIba361v3iZ/kAWLMDSY0HgekOMaUAvTZX3Nw+tjCuUY/qQS+8+5Po3WhgIRvtfkEe6DN9pKz8/5e2kLvXQL/NKIgVNN6sVBBim5s+ueDvrsf3B23AV24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4WWFITE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Znh9Zl8s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4WWFITE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Znh9Zl8s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T8XYKh1004786
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=; b=R4WWFITEKb+ehCNn
	JjHEHKjyz2o5nSM4yvI9WTO14syJC9mFAwC9eTjA+CppFd1mEYhhKm3jwGdv8tie
	3Ttz/+ictCsDKm/UYV+stCnsKxAujVDVTd0vnN+FBPLmqmC2n907IDg3tvTIVbg+
	oFNSAOJbA+tRaB8JYfAEYJFUK01DpVIziu/tkC0ru1iCywBvD06MY5MGuxyIrpWn
	EAps2FxGNuhhKhf7/7DCfDXtlLmeekVZ3XgDA7UcdBOWFb4+JPAjh5CCiVUvskBP
	HchiAjLGnQa94m9D8jdRTdCETxwODDKYkHda21/G4kZaGitA4sn7BiDZYgyUdAhi
	Z4fPTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4rfcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc51591102fso2821912a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677898; x=1791282698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=;
        b=Znh9Zl8sNc+zIPdBZu1vp89t55Ih3lX8FJj4doISY3T1Wacobksw63eH7INjRse457
         GcXdEP+gcsz3ocICoUioirHsgbM7vKbWvliZO0fhu/synPJObS3a1YKJVjKNGocOwsAT
         GBkTsjb6q1iT2kM/Q6VTO3W3xLL6EQqUPtT5EbQPobteupSO4eqYSfVCxOdEWhw2Nw6t
         5eY4SQqSFaDcW+JQ05WHSVBDVrCHFfvQFWBsuWIbxZ96zqRcd6DBUYvLA3t4Z8rkV5eY
         g0qcntiseOIvjY1f5+m2/jNRo/bLxu382MlZmsvRWRFSLZCnnads5xeewJouBX05ghOE
         Mb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677898; x=1791282698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=;
        b=0WAcHlJw7onKf+uf4sNm+iaQXtGiK4YM3JawKRkHWV8CDL5BDLzqP9cBPsHNn/nXWq
         oEt39O7EQ//SyjRiWGacOW9nYssFUSrQ9yAbVrCxDqv3JOyfamhBNwndoJLZcPtp7Hum
         OWabxsPl1TU19Ikq9ZJMRMYoZ7WrG/gRR2oeLK9gbGLpjuCU8UUrhJTaLBTH28qp2VSB
         8T9HZGoIfisy+kIRNi5FPuO/moiNdlV94SJHdQILlyKNza8L63coBjPIhEAB0utw8E7O
         Vkp88MgkUTkGXwzfvA+pt7/JwzLiHcoNDj9BJTXfydbMdHxUm5gDtLVYVRUu9JVGk1WO
         bgTQ==
X-Gm-Message-State: AFq9FYJxtCsPpZzjvHPwbXRAMjpRLsZQa+J2aKvlCn6hG7LhMLZTkhV0
	QJkDglCr25kZQvIIOb0zuIHEbSLVwyeXePZcgM6D4guIBZZi7i9OElslmOIhNRGEEYSMlEMMyXH
	r4VHh038a3tiVIEULJcC86isUT5cwfbh4OVqdkRiJcBjNd5Aajl7PqZ0eQb5M5s/hNzvH
X-Gm-Gg: AYBFou3KJsbQsdTSFld+CbQf+OzUaT5CbJz/BTJ4IYX+7THpAi1Q3skh2UfYHjtTE2w
	sdgW3gpAB5VRcilyGXdA1ITBZua3RWKL93ZtvgKmJP2usQf/bSbaAHJbln7WKJja5u06uyEaJRl
	3jUlXUKaSjOuFQJ4+bak/V4nAR2caSWX/GpxierCc42YH+qqXaWDU/rUqFmhZQy0Oy0PX+UVH+p
	RtVYKVzuOfzvtuCwcjb6phUoJdCTksy/7ZTZiqJ8o7CbsHsS1JDi8Xad1mJrCxf8j4prQziztpM
	/AS/FmY/GD4+n6ETn8X0Ga8doQLjhaN0VgLK3jOslfXcRsq7f13XRX3cHuLHB6qXokWZU/iogsA
	0VMlnNUvhMwxQhQ==
X-Received: by 2002:a17:90a:716:b0:3a4:a054:3d24 with SMTP id 98e67ed59e1d1-3a4a0544638mr1037518a91.60.1790677897703;
        Tue, 29 Sep 2026 03:31:37 -0700 (PDT)
X-Received: by 2002:a17:90a:716:b0:3a4:a054:3d24 with SMTP id 98e67ed59e1d1-3a4a0544638mr1037477a91.60.1790677896971;
        Tue, 29 Sep 2026 03:31:36 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:01:22 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sm8750: Add watchdog node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-sm8750-watchdog-v1-2-ea06d5dc7e54@oss.qualcomm.com>
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
In-Reply-To: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=842;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IH5VHP8PlJx1l0p+Guv+UYdwTidwqn/CA/t4WgQLJ6M=;
 b=mNr/z8bk5wr+wP+42cFBtlNK9/4qCofqS1YEA5f51Ao/KAtZXXOyEqMj4hgh8wtlZWmBiqq7u
 tV+3x/3phAmCEltZEVJU8V4jf22bagHdkN9dPT3kFBkBR9Kcjdv9EkX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX+Nj8nRpBhzz5
 /Ol1Omww3S1GIaifaF8nUhMezFkc1JpXbx2Ci6v3F+zbOfuu96kTG/GRBfWqDEsPOAdKr+FLVWB
 rVV0ldDZgpM9l37YBTioRiBReccvNAE=
X-Proofpoint-GUID: WAPDd-YVRJGRTBuFL17W0msDgQ2tCvRY
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abb938a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kZvZsOVO2oU7rQrdTw8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: WAPDd-YVRJGRTBuFL17W0msDgQ2tCvRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX9M+KRoVWLnx0
 qZadB3juJJEsP8Elrgo7qRatiFnrBBrwfKsON64ITYQTzBFLug+N3gVhION2/8KPoWEtn2YJ0cz
 7uMKqrZoek4GdtOxgu1rX5yH1H+bFvqd9dshCKc1eOvc1CE4dSpBQTBrFB0g3wsCb7oFATvIy+B
 VccNEaOGxOZPe0sTNXW3Yo1NiBQhF3WLU6gWSklxMosPxOW2d1tNUJoOpn+M4RU/5wUhNhSFLoq
 m5imnbfJLvpur198GZcs2XwATibgR3ftDq+HPKZjaWCNwsB01nwy2FmWxfmcYkw4RE2hG54y8jk
 xYg1FBY3U5baOvCa+XuIiMQLjQxqgOG2M4kQCW2PJ7as2jxzgFhChFQO8lvhyIBzEhhwciTCjY/
 9Cd/CgCKZT05mS/63mgmVUuuOCHFH5WXJtHmQkHlzuETvCG7dKrMsFLXbPpzNslNj48hxaA3/0h
 YpEJjsSoF5pDBjZqGEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290041

Add a node for the watchdog on the SM8750 SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 8ed5fa4d24fc..53125e5dc4cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6006,6 +6006,13 @@ cpucp_mbox: mailbox@16430000 {
 			#mbox-cells = <1>;
 		};
 
+		watchdog@16410000 {
+			compatible = "qcom,apss-wdt-sm8750", "qcom,kpss-wdt";
+			reg = <0x0 0x16410000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		apps_rsc: rsc@16500000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0x0 0x16500000 0x0 0x10000>,

-- 
2.34.1

