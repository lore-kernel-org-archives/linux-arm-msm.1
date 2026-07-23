Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313143B493
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802855; cv=none; b=sp+mJz9PDIBzbymEEJ1WvOFtVWGbv+w7BwzfS09U0r98ITS85hip0nt/hpgpFSFS+QVoDNDhtsSFd/mDVd2bs1XNjwFMSC44w8f8efNtDTLpOWypXFkAu1WKTzF3A12jNJ/WwSw0LU2cSxnwwHe/dt1sWADeldjKUx5ca4wLQrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802855; c=relaxed/simple;
	bh=9O7dQN+iQq/MGedSStzD8cvmHSCrIYEYqtVf4wtCGOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhBojG/tUtmXylFZw71JA2iZXytARctSl0rTWhxpjFpoQg038Vv985z2BDBpprWSGgQIXG39QyqLC0oUMXc9YYHgInJpQWSTp6QGWakzmPUKH9msW2b+XkHd2TF2AVPTdvISfO0GNvNPqEhlrMzDy42EAlXU3aM3ksYirWnnVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khcq6fLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZbO6hMo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khcq6fLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZbO6hMo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qVjR467134
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5CR79vbU1Cq7JYw+eJ0yOUZOivITvoIiOxb08LRvXsM=; b=khcq6fLVDcaa2HMr
	6x93YiGiotQmtN80xl+e07MMIPBWCMGq+WcoyCSO8Bz6MfDnFHq+386i5bl6uH7G
	pAPX8KitEjy1sPF+MXX3gnlEvrJMJbww/NkxkAGUT2WY5sU0SIde/uKgjmXI+dSJ
	RVOic8uDPegD1kFCrB2pF1e4SRf1HpbnGCuP6svVFh7Iz03HA3oKakigsgyQvfOm
	m/P6olwjynD0OQuHAgXswoOz+RzPvDotw0bnRtt+52gkFOhfA1OW6qMawL+zhzlR
	XLwVQQAaWpgW3EuEG+brYMAm1tl9KuF6F4tfGMwn/aAIHd7yVBNc1VZnW9ridf2M
	z1sMaQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xukhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so10481475ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802852; x=1785407652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CR79vbU1Cq7JYw+eJ0yOUZOivITvoIiOxb08LRvXsM=;
        b=kZbO6hMordVqlUZrXLsnp/I7euu3M0c/THqDze5lUGsxNhQJSyizwAbIxMG7mQR7J8
         /jjUSQtwk5W8QEtIsoMQwCwB1oAf9ct4L9zbQb1hL8Z8E5rMgOfMpJ/S1V5JLJ+R2/DU
         PIoV+xZoCjGTigSLuhOkcFnr3+u+VJZLH+jqBzUZoxVx+IbZDNd7OjuH9UdOTYZgl6LD
         mrpFV19ihKot/LbxIxHJKpP+bPYfk2OMtWaSRqmgfotdyLY5QTKeHEojUXFvhV9IgvX3
         L0lKz/MSm55jzMTlYjUwVKACc3imC3KKJ8qEeUmeVIyy6gnFk+E/LQEIAiimmxqdjFVr
         AHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802852; x=1785407652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CR79vbU1Cq7JYw+eJ0yOUZOivITvoIiOxb08LRvXsM=;
        b=Ge/bXnqt9FGX+QEItZkRH+zveVsp4PU/xkQ5MYxAQfLLt6GP8nMbyQeqcQodGN/6rj
         XyHKr99GK5pNsPGYLJHFuxOUwl6M76H7vzAk+x4z230s39/vJck4wcADgFPf9NetvI8Q
         Vinsabl3vWxcaWWOC0gLo1puxXvmjPcD5qVj2A8WH0kgqxJ1IUjvLHVKYQZPf9h/1Xd/
         b/Hey4ySabDwOjd3N86Vgw2JdslWL9hz0NOhcYbM3cWQE7DY6tD0OYQDfX/FsyDTeQIE
         wXhvMxJ2NFS2YI0mjNnMqPZAjhe6eAgIbGXj/euGPw47LxGStW6ZMyOzlczgKe+cJkka
         IU0Q==
X-Gm-Message-State: AOJu0YxszrFgUB6lP3v2N2KgUTCY4/H5Qsd0nQO0qhFg+B4qxajaaws2
	xX5JuXP2KStZo8qaqtkklhvF+1ra3Y25Nn+DLZ39xfY8LWf7XV4dUjmXWo0wAY9uoIc1KJJgQOq
	8f/Ar8eXCw8ywZXyJ+o9N6h1CLOLu9X7sIn+Q0ZmBBEacmetw8YDzV5OtveIcsjQoMSLV
X-Gm-Gg: AR+sD113/ZOKTcLwIYZzfgBEcxZFJwwVjRLprN6zcgVZMSfzh2I4FNkhkrGL+LsbQMm
	Ivm/yJT4usclGpMgchWWMAfQ543LxNrNi8JgsFZkcBS3uNQ362RbQ599OxknyEVZIU+AM6p11JF
	+Pb570VstfNuwS945H/Jnvi44UJTaEQ+0zts/3Pjhelp/tsQcj0olj33qxJFwpAJwU1DIBgReM8
	6nwXbb0REU38LzrjHZ/GukCUuw0KJfIjrKsx3IiyfTT6kW4Nk2ePQ9hJiw8fHCEJMFkeuaTJLy1
	t9s0Sm5RkdavoOQNtjCaoTxwEsCIas51lHV20JnNMJDDTIkkn7NcMY93Z82YmrSg1iaoAWLBD1+
	kjBB9KvP8Uw5JLlVJJaE44Vf6asipmSs0MB97kJiCWpub9n8nrPVeVaBtgYfpXSWeHRN4yA==
X-Received: by 2002:a17:902:e945:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2cfa6bc4699mr27668595ad.17.1784802852533;
        Thu, 23 Jul 2026 03:34:12 -0700 (PDT)
X-Received: by 2002:a17:902:e945:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2cfa6bc4699mr27668295ad.17.1784802852128;
        Thu, 23 Jul 2026 03:34:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:34:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:03:53 +0530
Subject: [PATCH v5 3/4] arm64: dts: qcom: Enable USB controllers on Shikra
 CQM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-usb-shikra-dt-v4-v5-3-5b69d9eb0888@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=1317;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=9O7dQN+iQq/MGedSStzD8cvmHSCrIYEYqtVf4wtCGOc=;
 b=MdLyx4zK6LV7PGKX+djxoBafxQESRkpwWOEGvUnRfI7p2HMU/D6BzsUOzL/NNan6QfLQ8KfDD
 OJhif6IIn+kD1wAvtYCZRgXOKKDCwG2XZa9htRkjXoKgMOiI83PuAnP
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 9vTQt9AOdXJe65LRupa7mEjd-k8UCW1O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX6iXbozFu87Lz
 a/NTrw35942z243OnPBTwbZYj1Ct619VIPpH3b7gtzyY1/RqpRoUGtKfi+30K+nLewveuQHZI+x
 DwqcwDIXNMOvtJL81+xnCxVViTBKd84=
X-Proofpoint-GUID: 9vTQt9AOdXJe65LRupa7mEjd-k8UCW1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX4obKHkUw5Jz6
 k57F6fbuejOtMp/mO1etIyy/3lBp7tUX/W/Q2KOedUVlyDUJm6BcHpVn8hapw08gZ1zLAarI0mv
 BDuv7OxICKOsnwFP43UR/C+BmfvSiCDq44JM6U50m6Af8E65Xn/ygJWi+YAYQy1ph/1hbIxf/9j
 Hk6NexbUFPy9wupgCib1xBoB40x9P1G8F22KVd9NoInSiDvZpC/4TVzOr00MdiCUXt+386eWdOr
 oQ/6cYPibrWQQmN8KtaxOph4otk4KWN7ZIJGPbxtwt6pdcqadMZ4lu+SKbEZxzX9g9Sl6ekE5Wm
 4r/b63SVKPeY9bv9voadPWluCvFg6oUBJKAlEebDpcMHTLAGlhl7Sn9hMf7I1YGokk4MAlBYJsi
 Qb0vaZHpCzhh1rVEjxbiPHkr6qV1Qd9stCLHTbGcpwsoHJgrqJeq/15q6hXlv0S9YmrsFSKL5Nz
 ihPIDynGOanxmSvjjOw==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61ee25 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Nf4tAF-kVs3HMKYhumAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

On Shikra CQM platform, usb-role-switch is handled by PM4125 on primary
Type-C port and Cypress PD controller CYPD6129 on second Type-c port.

Since those changes are not yet present, enabling both USB controllers
in device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..e58b40389ad3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};

-- 
2.34.1

