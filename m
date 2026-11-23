Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458538;
	b=3Gc6TEeWaXZGrwmbrFpFTxIAcNcxCsiJuc2G1d0K5dmyYJfikKinqvQeuwoAgqq5h/Tq
	 AR25EtIggwIZRO3+/UI8/hWw/JdFq05zpE3rlCxoaJiunYwRIka1iDZeyCIuD/31HH3iZ
	 S8SWWKue941QWnzH+UZFea8iHxQ3tVGwHLUcnnKWC/AqQhcaUKvnxMEUZy/35RKu8s/Ts
	 DwVILNUTrnxhdt8Inh0VdSFqzvIlys2xiXqODiOofiE+kqzBVm7iSSFs8/z5D39iw7Z3I
	 M4dEh8cA8Pz44BWB55I+GMsVre25Ymrp1pnWiMk0Qv3XuV10E8tx97e9RsxK0qEuYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
	b=tDdXWeqM5JZiU/jNIhwgKSihod+J8ppRU2lRc+gKyaQreYHu79Jer2KrEC6pga2+swk5
	 guQFXTQfWKQ3fbOb3VDroAg22FyLiqngmaRCRCGbDo9WalI3tcxqlM6q1KW5zslbpJ0Vs
	 E8xQrFa1ItOutm8Nkl+7BYyB4RuDFuNjgIYHOdlxGM6leAb7uhYahrXrWcP/witU3zS0X
	 mMs/VGwCt++OuLJP87pUlJPVSVpPG/FN3cQw4J1juzblCXmICjSis7M9/iLOdssslq+5B
	 +WDxZQ5QNFBmnqYERaRBE8ialxxmtWe7CVo5RWW15PD0L53Yp1nFtU65X4T2/l2zpmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9BSbVdI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmDBTcGm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE6A606A336
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE6A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9BSbVdI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QmDBTcGm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxCh2377193
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nhfcchwZrq5
	HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=; b=M9BSbVdI1BAMdhptdNQDL4nVZz1
	rEjTTxVHCT5UZS1IIOs9jPja/Wot9/8SjIdyJuhZLgAWVvb+tVuWe38LOjR8+4s8
	LiKBvrfdpOvoVmv9sgREwPpttVAP9lEzuPLQNmnNU1lAN2BV+BfFMqNKlVOI6WMk
	dYDQb1z1EV1nW9jj0QGcfbWkydajRhwDmB6w4AES8WlaS10GqaA1yM1USBsHILog
	F1OtBUMeau5y19Jn11LA35R7XwbCc/v+dQCyattQZsIjK3YFWStkjZn8121fLEdV
	E8EaGNkR/EdtxUjqnFF+WaLuF28qadDHDxrHwKAMm8yHjzglgm2VDPRlB+w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ust2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5048661eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458536; x=1796063336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
        b=QmDBTcGmz4ANsPxqvzEHX1r7uNac+kO5DLv29eXA+tds5vwEacHlnTByRB3jUFz2Ic
         7a7SFVOPwXNcaYTfuS03iZfXBxlIlPwVY7stFEeaeaOrc8KrHuacMH8i/uFJtAE2UaCV
         cBSmqdAUEDwIltNg9sE9/hQLyACrGpndsyYBfZZ6voXJc/581yf8og1C9DXMvpaeJAtZ
         WEtJp2cD7iM57A0TzqUHSKDPaTiF7ADzVILYioHtJQ3A9JiU0PHHGNDDk2FY3GDEmiQQ
         1cXZOdxZoBp9yIubt9a2jP4EbhBYkgqgufcUafHv38cppn06TcxyPOZbchLlz1RxPk1l
         254w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458536; x=1796063336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
        b=yxWkYey+rYA+iQmjQx+CXa6rbkFA8cJ5t0ZUwQol9QEIh//a5hyD/JHLTPgPFkOgTu
         AzvaRFmnqo2+1bgLoARgBPD4n+3AaVLbffzAkImzf3NVp/eu6joOdhdtHH/tlXsCfClC
         QZ+Fpt8LUhY+7bwjq9dBNbwQsLahV+n0dDZ6+NhWpQO3NOT252JhvPJYSKCsVWNwrK2v
         FqMW5e1CJWMmU2NIqdnLrFKEkqtM1d/B+2At7hp6ssUKcEwLJ0YJGItzB+U5wK1utXPA
         shKRNqF7MfgYSiZZ+PecVgZWWEKbgIETIlhCP5WWRsbk8T9IK6pnvw1WUjfq+49HKKNj
         JDpQ==
X-Gm-Message-State: APuU4Z/VWGqBoVXWOiMwMYdISTf0agoYwp/6G/3+PXUOQQXxgHmhfAHO
	HF0Liw0hvKN9VeQdmJA2kRqENyizVPOqHADMtUwSdDVMPKao+5/UUZh4HYpCuG4vcnb2XbfIwka
	ZPFlnAHRBG8u1bxdWtFXYINoW11S8BeqFsHpcgMm8Hjc7ieOUfzoXZRObWBN9Q58Mc+6V
X-Gm-Gg: AZFdTZdc97It9P/w3vJhLNCNDq6xHmDGYhrzIdGqnTP9Fbru+uowM8OzSybvgCttlMN
	0prFjiMDpAaRFbNnXvEnXXroo9PPpKRWBiX1aqyhbw2kSaB8RmghedQresU9H9q+9sE82qPMQK8
	Z2S3r4ndanAgCdZWgi4p/l2HkKmJObZ5ckshiEZgFsyggUkU0t1lZoxZ1HGA7GYOhA9660CkDiD
	86bf5M641dnokpdyQPz/rCyowHdm3IOzQlNYDhHOyO48VzTnzjU0RtavP+PQDK4iOvlMkYdiUnL
	ZitKGdVilqt6l+iExLJE5ZruKH4/5A5SxOsdRY3WF2kU7AyATTHxH1Wc6Ti1lMsYlss2xy569/g
	1tA3xYltFKj3yH7Gx5pO7638t1iyJ/xK56khRJuwA692EfvRjWQAbFxScUfnRQMLYmkVVREsSjH
	yTw9huNMchSk4amXUU/TJGw4mY1g==
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr12339158eec.40.1795458535446;
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr12339143eec.40.1795458534987;
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 5/7] usb: misc: qcom_eud: improve enable_store API
Date: Mon, 23 Nov 2026 10:28:45 -0800
Message-Id: <20261123182847.143892-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Tbt7ah7Qrfp2JcYxSwpclRbEx6i7B5TH
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b0485e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Tbt7ah7Qrfp2JcYxSwpclRbEx6i7B5TH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX6JINWKARqW+l
 5daPFEZPbBK/zk6z2g2yC7WpUxkfDAyJYFthCds5y2Z0T8JCDVC4jT5NF4pCCP3Z0tKzVj0+wCA
 zdJNMavbNCDZyrJjeh+p8hO6Rx1M1gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX3b1rpXetKRmL
 kbW6phMwKUFeZZub0HSHQFh7It6DVAjtdSBgLv2/0bQl784tznjcVuTzdQI2R53eiu05SO3shEh
 FpM64BJmDGFqmH/wROvOCoFYAzEY/mS/2M7IQqI0muM0M2denf4QY9ywayiPrLUjGgbtV9zPyVT
 kpGV0lhLtIq4Vk2N1zSHmVLj4a0/F4nlpzVw6uS8l4DgeHiFq2X/V86T6p4LYfI+gWrYb4Q4gp5
 BnpGLHQuzqPM1AqhDewD1CWYm3quxTSWip/gn603zkxcZHPpECOV8HSMtWC2x1MGw2VyIzjsg4b
 PogWQWNB/o54vZqaRSd5heLo++megsTcK9HS4eUx9wPBrnsLtYx6d/d2EfUUusNyMQFlSIk+Z6f
 poFbLRMw7hDwdzqjxMvJKOt48rigwb6F7R1x6jXs9zmA5y+bzysm13nPX7qV6yk7ukbSo8iIEMB
 l06N8W+Uv9iKwM02PVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 2304402fc90d..9f26231b6648 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

