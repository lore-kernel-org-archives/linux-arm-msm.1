Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6483909A4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754033; cv=none; b=pxGEb3m/qkKGUcnxlv/YjluCu19bhac706FK+EZUkOtNDNhaBNA1+iG0QR0FANtCWp+TuphEOutMgzlwIS08g5zzkGaz2DWlvA+OcqiBmYUVFTjgT0Sw+fQAaPam0bShAQsjNT6cE9YWFQsq16DK1MIQQ7rgn+OQUQ9N7VFdtsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754033; c=relaxed/simple;
	bh=bloAeWS97IJ5qqPAdt7nsKjEyYSGak2VI2PPUR8dBeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhjWu80jhMbMRJapIr9dInmiwcDbWe//fp3uaPqYbU9ZdPAKTcfv+dbXMk4Kg3yexKm69nynXpTXkD+CJOwkUEkNmUhyGIrmirtwIKRiNxj64+zcmnOem83+/kmL31nr1kyrTI/7nqNWKsO37Rqykv0exhVPU8kqpuobNTRlm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSGHcJqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXu8HiCA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSGHcJqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXu8HiCA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AdIo93654508
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=; b=TSGHcJqoBkHM8Hle
	SLWqnE+KCrjMNHYsoybUFK4xFnfXcwb/kSzLpeOLr6VhEb1un9KmumJ6Ij2QDN3T
	n3uPlzKLii2S0vrnXpbGwVBllZZRm6xjXFf0gld3be37t1MUB7ASjtrGVEvkk+3f
	BLgqoLrBRc0lXJhiKvfO2ifAdYJo697EqWH4CyBWT3MEw2fiTCh+e0c0GRpleNF7
	CLge17pzUWU4P7fQa3R59fOZkVQe8P+xD6llkWiQT+IiSlsSNfUAgi7VZ8uUP7OJ
	4aF1aepeEPpQw477EvYbfUfLUA/SamggBSPMMwTTqF9vez+1y2vUUF3nfFiM6M8Q
	Lq45Yw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb1631-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:47:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5003254a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754031; x=1786358831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=;
        b=GXu8HiCAZtfvt/rm9MhXkTt7EcevhlwF72rk9t0jR4XhLOw0cdvTYkjHCv1URfAbXC
         gJuBsjqxRm5vGfi9IC9OLP7tW6w6Ic8T1Qa1ab44/Kf5INJ/slporOrhB2vIXyGb0ihk
         4tcfoAZWcciwhlH7GIvEoScPu8xqz/r4c8gh6oYyplm7Gke89DBN43fCL3CSgdtiGJ8b
         ydZG1ASAKkhItXK5tos5E2Ul4PPK7Igzya/1WTaPSZi+3Z85h5ToS8gbXKQ9NASXrmVb
         3vs2ZpaeDtO04Pl26GG2zMOnqn5cxejLV7FmlSt9nXcr78yChJ8uF04TPV1QTH/7mP8B
         I29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754031; x=1786358831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=;
        b=XxUpUxTf4nMkjI6/b1rKlzBbCTeJ6oFNf3FcBxhNvED+qRdeFcgz1ikHZPbZztWbwb
         nGlcN3HhltKea4KNr7qXXShUtihTXJ1bffzWXU386KJt1jTLuk+3TakmkadigmvStMQv
         dMRV1VdsR3yBFJZBVJTXEL0dcfO64p0xFQCm23zaL56aSw8jqGg0h7APyFV88ADSWBdV
         oSqrTheAyi3ZvOhUCm+w6PEYbcQzhBzx5wdUS2QQbKUoUNYn27apohDMCp9E2LrE1i/T
         gTFhjOeoFkdeDcJJRcPetiIe0jIF7o//MUs80vW4n97gVmkO9PoKjtO7GWpqQB/NODi5
         gAsA==
X-Gm-Message-State: AOJu0YzTDoRt0rfmjD6uYbyv2nw7evR8m7cL1QdFf/GGUxtppv4Lz/D4
	VwSBRk87/8lPk85Wzt98zL2ORJX0MwKwea4QiAFQ3R3FUw1k3HbTrjDu9zH8laHkaywwHnHrAuB
	AM5dJPo1PdMSqw3jRPIc3x0Cm+7I773EswCwLmY/4OzkxUH696ogElQMkA7/qBEy7eRjc
X-Gm-Gg: AR+sD13AW2YBJXDm+4EDjqxYnRvmbSDu4RRRAgMFIkELuu+VzvWHa32XmM/ap9WHj+n
	OhYKF+Jy7kGzq0/s+NONCLT5MKoQk1/Sj8KEkJjwtgb1B4qG8txN4olg5EdLZTkaKxxyTaWh9dy
	crvOdgBmtuIQblL4DTpuxkjYCZTkvpIvbvJyxVW+GiiecIXpGp8vL62aoGbdvM+Qk4Jk4lIRs1j
	l8svVjFHn8G9GNIIuVOsZ1+3FPkGilLurjRcOcN9/mi9S3Xt/dRfYSv8FIXbOBU39CTokh0y/hR
	kiauH1YxLtljglDXG97IKlP0S+Z50VP+MwqYKMmNlzuReA+UfusB3HwAexTODU6gmByAAJ4IQrp
	qjKyLque8LYR22PKllf7I5YT2up9tiT+B6w1Vhb0T9GG29eJUT1897knPKhtVpkttTHTO+zHnjJ
	KWpn3NXDpRWvYgNPIQ09ncxjuING784g==
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:8ce8:203 with SMTP id adf61e73a8af0-3c92a8f3287mr8929325637.50.1785754030624;
        Mon, 03 Aug 2026 03:47:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:8ce8:203 with SMTP id adf61e73a8af0-3c92a8f3287mr8929304637.50.1785754030211;
        Mon, 03 Aug 2026 03:47:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:09 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:15 +0530
Subject: [PATCH v14 9/9] arm64: dts: qcom: ipq9574: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-9-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: skiaes8io3dr7u9K9B0H2qhSzmtNAw5s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX/VAuIpfT9qJg
 dTBqXyD8PkozxLEi5Md/4gsgH4qzF/b6MLe0CRwJLjPv/NrLZO/9leHHTzqO8qScVa+yfAaDMVu
 LloBln2XGcZcw6rjIz60uY0VxyIi3H0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX1xrxI1kFEBle
 RpahLjv2AYFqbe81s4fwg9YbHC6QQU+aUd+8qo2GvBf8JYlQ1eDMgxa3ZXKbPOkgDtb0g5CwhEW
 aVtsitUFjNRDPg5Tm2C+KDEeK00prMx6Jb5EVZI+5pj9DjB/idUJrAk1vW/UOzOvA1LrW1dzuoQ
 jYRI4J2r1Qh7UngKrxu8jzhhu3glmVQTFlWxSDtPEyEeLuNoCbfv5c4SFvuFL8aE/7qkQ+8oAo4
 eb+v0ygwYz5yqolJNn4CyVlgjAPF7rFkZBKF3v3mHAkPHQPIwdlOnn4G96g8dOEGnJtojl+gUk/
 oX8XzGs4ImaCq0GR04uGZ0Jw2YOBAVI7GPQkvHQVY8aFkbPIZHSadoEzhr2LsfgqDcki4zpmYf4
 xTNn6XdjJhYpK1vDoQ4tjHpYT9OqV7vZJrI/aliI89RSUF5G7/DdiuYnhU+7Im684WnkWfAbmKC
 Yr/TjxPDxp1Iuguk99Q==
X-Proofpoint-GUID: skiaes8io3dr7u9K9B0H2qhSzmtNAw5s
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a7071af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jH_bmcyh0L3YvPtRZzoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

Turn on the q6v5_wcss node.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..494a150535cf 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -113,6 +113,10 @@ &cpu3 {
 	cpu-supply = <&mp5496_s1>;
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-mp5496-regulators";

-- 
2.34.1

