Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794944;
	b=oomusEsFCff3KvZbeJ1C1aS0ICyEgH5FgorLPoxgA6WJVGxlDnXLPmT3+fH7B8D8WuY1
	 OuFBrNylGKISJIEuHopQXg05Rp9uzfUFW3R0EvFFU2KZ6L3JadLqxtz4TOscep4Xal44V
	 JNK0hsT6XZPEzxtiEYpL/7tZX7Fo2BLS4rtd7D5Wuc4E0foxsjMc+XXnRvijFFXmsV23V
	 QENWhGkyTeRhbthD5hcy5W8aJdJyIh8s1EVuNPBDU9/Z72VYYOrZqn22PIHjNL5mZgLbl
	 ntQDTep5y/Nc1X5bCd4Iyvwu2jfYdCp/YsPejbwL3rI8havzSgVSavFgLmweTHlcjvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
	b=TpX5KLSC3TzRKy6nBFxaxclKqaFa3eM0VqARrerf0n49T6pnV7dUwqYCdI3uIqr1yw2/
	 yd2I/tWAoSHNipH3M8eMHy0mke9aslUqWzxJlY7IOhsM8OOZtGDDNakoBRXtODiz3/ARk
	 pAMXvTtJHSbvADk9ZjPAUJwqKOin2MFDqbb4/j5bRD+TcM1/vLhx+lkJzosxBOMUHyTag
	 rwYFFv/hBB+iPHti9nw3zeHtXf7+JtftK3+HYu0b8NV8TpPVPCmY9qccXf+RPXRYz9uBS
	 P9sKdRWmF10APrOvnjHYelPs2/NJQ60i/QT4hkyVjYbNCG7wzOFjVuWtl4O6hU6/kZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62B606A33E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC62B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp8EE925654
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9nbCdb+Wkcs
	s33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=; b=l75Q4gj3xPtQT6qzP1aWYxQQZz+
	HMqeTl1UvdzXGp13Y3jS95txfQbIsskxTt46zbh+S5OP+g1MsCj+GR593ZbEhk48
	2KN5+kqpgTPelcEWdyiDcLHdw3nvOewFOpryhoGyifCbH9+t/DAwhpH8NSR/jQ7a
	uTZHwHkw/kQdLafjmjZFM9v7VXTDpBzrAjHTTiPPbde53nebF3s2RV+A6LId/EJe
	jtxbQo1KWT/NZ2my+f+JqUHSzh1e+cJlROabOFcekuS0f8G8yLUkYyOE7KPNbl/V
	bFgExzddoN8Y/7pEL/tBHjJLfbCaJog8L/KHTSTGCuRNB1TDl0zfS23Jbgg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bq0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92179251e32so53733256d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794942; x=1796399742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=K8dAAePzvBVvSMjqRtQIBBSWERR7aNAiZ/yi0iNEEv9o9wafR02hPxRg+3noQfXdXf
         3lM8OHv9QYAcLU+jS7J4VQO4k1loHDQ07NfoSSJAM1HMO2KiGpPIBI1tYHm/dAW9ebQI
         Ro3zPUQcXzGlZsggNDJj0Mp09kV7sH/QDD66z8YfI4WHYBoqTYRg0iZAAsmlGJqJb1Gm
         C+ojV0VU6krxLWpQ6O1vT11WdfTn/Ho3UuF4GM4Wyx7tZh6aVesr3AFFAMsyZPhtGWkT
         V1Q9/R/j6E9w22+8VpouZoDOhs7LykgSg2NezALsHqvoI5C7P173zOsEc085oRV1/Tde
         B/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794942; x=1796399742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=f45C3x3EIlosvcqMIdodGePxhgoGJWIkrZPMpgGfQ9RjmU2nVKUy0xdTfX+YQg8DtZ
         ALHcWiGM2F6ohSaFqrFW3u8ur75zqQ0/ZoQJ7FsW2oVnPeAAjk3mTo9qkV2FlDIw5K23
         Ak+Y7cig034p6fgaRXmxa0ygg/nIx7p4RAw18zhySnhY4M6OL6XKrC5WE9DTnvcNM639
         AjsWSS7A7J7ptABDAHBnYa/3d8p4S/U7cnq92sdTvq26pMlgrnh2FCOSpkg9ZbEo72WO
         YF2pZAEU1EFL4dJx2J2WO8l1hA/2n5Bx7lv1GzW4/aLwwv1iQSmcYxgQU1ZZv311sgDU
         ZhqQ==
X-Gm-Message-State: APuU4Z9AtATr2+NkJ25yCI6O/r8aZPkLEeSFSvofnyz3xa7INNxND38x
	B1hY93m+NGOkAGVofiVVBuhj9wAlChjbFy6/SfKfJ6Si/1S+QWCgSKgdBltr64gN6R6/G49LmI4
	8N8+0/crNAlpdS27YPA1mkVf7lPUnWPfeXNfatR8AZiAfYgVrJC1587IUmedB2CPC5HyN
X-Gm-Gg: AZFdTZd/uHaW4/vVjl2cqL+8svBDp9R793Ce+q1xlJ+RGSdkt8g3upTj/J8RTDVGiD/
	AVWgd5LETr7tRV1LJdcATLvgCICXhEbb912CAQJycI+eWTa+xAdNh5e50SzneLA4VipIAaq5fbe
	7tSp9l1x80juk8mGMOreCBDPcFuubqEdydsHBOqNTHDMJNXTVgNV8BGzNKFTJ0gSeJSSnzOwdao
	oRe1TzmKgtMOnxKial+dxVcmDA6BvbLGGxnfAzG8BoLk9VD3rxyCUDYyn21JoS4GH+a9xMXSHLS
	9F3rfupnGVDJ+JE4tbtqJ4TUW3vfGxqoFba1tW087d8eZmde1c31EmMqr4g5lxxSaGfY4Qn3Yhl
	2BSW5elz7t9583+eP7M97tghr2xwhy1lCpSCi/sSvnuzRlsQCZkg3ZR7l7R5IpHqD
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440884485a.78.1795794942444;
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440879785a.78.1795794941976;
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:19 +0000
Message-ID: <20261127155520.358909-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y0i5_RBWxh0_xSbozLEY7ZNj3FRyyAqi
X-Proofpoint-ORIG-GUID: y0i5_RBWxh0_xSbozLEY7ZNj3FRyyAqi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX96PCf2isB4ds
 CTTU6jkS+7xN6lc+D0J9W0POS/8G9Ti8dxqTkG4LDFoXp39Nh0rSBRg7Ub88pnONmqMYjoHaIVl
 PmCMHoiQRK27aZUiSLyM09RFlt4rA7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX3A1qzcYe3xOa
 RKHOofJJbUB6vVMTTDNAg5ihaoVseZ+QXgzhrPqUkCn0Iru9M1uXYh0AGoeAbc5um6NpOZ1xB5t
 30U4DkxpQtMvKwE2kTWdUm/QERKyTyjCiNRsIDEKi2tFbP3velQVYtIuqxK0D30hAyfYVb3I8Zn
 h9kQApusMravhI9PaHgAEMIJzArSYEgrnhhBEKqNtTs0vK0JpjK1rx3ZIPZYsKkIbp6GFiyC/Qk
 FiXt5uDOqm8bUwOBzp1YB7TMJv5ONllTINJMFCxhrX2+e+fX6EIMD3sVI58FbPsPR+TE5OsS1Qy
 /yfJXGIFkbxWiMwHQsVeCxZsgAQmxt+XPzTGBWrv8WSeHU4JmlxkqG3MwtFPSJxYgQ/Cm/KrtmY
 kwKnCqxxLl3AEZ0mw1saG1HOvpqs0JGllA/Uh0ovlN5bzVMLPCYtBKJYwA8LdICN6miU9Lu/PGS
 KQlg1jJuMovGsqvMJTQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09a7ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 3922d3eebdf9..64740ee1e3f9 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -343,6 +343,54 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
-- 
2.53.0

