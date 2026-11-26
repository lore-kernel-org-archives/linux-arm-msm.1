Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672216;
	b=tc/z3sjWp2ODatafMCUZOxGHcgqmMaH2BSyld/mzmS7keDBowAcoq7i1dnPTyfYlA05V
	 xjSL4Ouog9iR6u5V26Jwh7EU8/9xsiHHf24jSVpnRHGow2t6WLpmT33CACpi9NOxPt9TF
	 +jf+h26yK9Q1a3AuijwvbanXnjFjsuNdo0vSrCKWVr03bnVuukLPEjvi/P8//Tyuf1PQG
	 NT1rquv/eFiI1+5d7cJcgfpQcmH6NcMPh2PuOPFmrZPhKGfUo3LVyZ+3HAqTtcRPRQzwY
	 GMANUS5lag2iXcQSacn/2g2MXHozt3zvX0bal8KqBvWKL8hMrXpD0a7TrKNCC7jFK4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7F2O2csUCBBF7nZbrAGT/+JaFY7SalieFm/4qJ12Ccc=;
	b=H/8s3zqcEf847G7MQTfsQ31NChw6qw0gA4zAJJAv5rc8eS74VIvYHLz4omuX+sn7nohm
	 nCjnZPCnjlFXC3mgU6bnQQo/c+f7AdhzIQKOgPLxLjNL5j1b3V0bt4u2aX4KELtVPrpdq
	 KDOQSPyNc1ijwS0veoN33o6qp6I9xHcHkhiLdf4E9JOOuGYWvM2frIyimtWNJR2Lwlm3Y
	 14zbOI+t/rOmYPvIRlT1OEUgsZNF0B5hN/rc91c6mi807FjPTfMQy19+jm4xFaAS4ROwQ
	 E+C0+26zbarY8G4ctVBSQyr9XBap5yOK/vtvtJtDHiXTWlbD+wXREBVNjeQ7Pw/KBqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=julWiXhI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIkoVceu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332E606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E332E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=julWiXhI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIkoVceu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36JVC1812745
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7F2O2csUCBBF7nZbrAGT/+JaFY7SalieFm/
	4qJ12Ccc=; b=julWiXhIDChDerVvQXdfNZWsKRAwqc+ZSaBHybE9UnPg+bH97rP
	uNRS7w+mcY7PrF/5GgZPf/vroOn7fGyBbXxrHZoX7SX/YBMnUSYh1xQ1YtRv4ydm
	ua5g27RyCco4/ZiA2KnY9OOFk+9INo/3k9C25UTo/1AZ6OrqjpnGYvtWQyTwTn/l
	dPvfbAUZdVlK5ZfmPbrgASsKzsEvQZ9JZN6+8/H75VnZ+3kcFdeIhEH/hoWGjrWY
	jzCyFGQfBXo0ZUVuZRS4CMYC0AJhThNPjhWkUOVU6Fev6LdosNtrj4IruTBBJdT1
	BOajCPfliaLolMiAwErJUV7vQSaFKXnghjg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak00st4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:50:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so9089114eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795672214; x=1796277014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7F2O2csUCBBF7nZbrAGT/+JaFY7SalieFm/4qJ12Ccc=;
        b=kIkoVceuwDopnIlqyl2EAH5l06vAgvJ7797Yx7lntcX6u5/MVOaUnsW7BjMXSLYJkb
         MMwJA8AihFnFAzEfDqMt1I7Bb84LUXT6g/lMDLdpQzJDtVv/GIEwjDUQ4h/GyM9hzKYu
         eN31vic61v8vAWTZVV31SuLAbaCq81LW57Cf5BrryCr56wr80xBAKGeCUy4mWaq2qjZd
         rQagSh1nMRCruemRcyLxwJXtYpKOT4l2sAjiiqs+q2geUhu9SA3pMzQKiShpnum+Xm20
         tTsJK2eCzml8GqWIhUzfstmGbMY8/8vZ1g0jvWfrMUVBc+Evfo+tNlmWGQuY+fRloOue
         tuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672214; x=1796277014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F2O2csUCBBF7nZbrAGT/+JaFY7SalieFm/4qJ12Ccc=;
        b=N0R3L291AQDn7i/Pb9v1Dtmhane5mNli9JgdJm3SC3dl+UyS45xgdgD3Vzb1WubT2Z
         K2NRqW63U1SzTNRjGLXfDosbBkfVx7bFdcvtwCprsi8Hdq7DCGa/+M0RldEitk0R6Chb
         dn7ZCe7Chyu8KaQhry39MLQH3YLFt22idGQs1WOXMrgQlD9XHyyiSOkxzpB9L5JZqVgL
         A+G+qsuMYB1Kunmso7LlnXNYBvXWrYZECTZj77Ikxe1SotOHnB6HZA9Lt+kVPo06dqZw
         dCYmQg8J0Jy5ZjH67qaMwPh/kh4aDn3U1mJS/w3wVdqKvv5svNRGE8ZPOEUmYGiYcTzr
         65dA==
X-Forwarded-Encrypted: i=1; AL+hErFUYfx21zMj/F/pADniz+DWyggQ7CO4EroVXqbxG155YPQx6bzYfdnMn3KMRUwIyRRLQETGTow/ifz8HsyV@vger.kernel.org
X-Gm-Message-State: APuU4Z9aJJc6odaJC2JJUnPQLXRuZhqBKlbdPfHZKZ/jpIcykLEOcPvo
	1CYaPML7JQYI9fO2LdXSM7SzVRIbzLhJPyr3fyEEwbBFciz7V5eCT1GkcKQbE7WDXnEYf1/ltmM
	ESKFmx8VFTrZIqtCeeOPBy/Ajb6FKpGTmgw8BiClHZgrByHoDw4j9YBBfTA4YFXQ572GP
X-Gm-Gg: AZFdTZfA44N81fOHKkTLAgChctutG1rG4GYFULrIsBpw8dGCFr67T5rDij/REEO2hob
	cnDc4YXgKUEyfhx5/DOWiPQjjzSuBwZjlTLezV2t239Aw1ZbcNfyr3MeaQdcEu93kVmqZu7yFQ9
	P7TTKYZOwKZqZJuHbj6VP6fo7DoCoswx7zqZ3nHmVdkKH9wxWy63tkaZB2hb0jWFkK/S5ptyE6l
	n35MgJP2Nq/rdpPRMfDX35PFaKaSY5BCMTVvQP/wmIbO6yI+jEIzwN9FY2cNu59OGNhq9nAiI69
	A7LTDjrwZOqJrgNfeq7gyB1odGcl2U55xt4znextA9x2SzBu8KfRMy9xqddhDyrFXKzui3AFEzb
	Pn2mzZhnh1To3QwWz8oLFMNTB9TLeRDa7LDqjz8tMWr6vUwnj35amhBQmmA7d9E6tUwX9jKEVpe
	SN/1BtkOhVYdp2VBkIMfz2Fb9Ij4g9cpEbRqWUEA==
X-Received: by 2002:a05:693c:8843:b0:386:b526:251e with SMTP id 5a478bee46e88-386b52637c1mr9650957eec.10.1795672213667;
        Wed, 25 Nov 2026 21:50:13 -0800 (PST)
X-Received: by 2002:a05:693c:8843:b0:386:b526:251e with SMTP id 5a478bee46e88-386b52637c1mr9650934eec.10.1795672213179;
        Wed, 25 Nov 2026 21:50:13 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm46141619eec.1.2026.11.25.21.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:50:12 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-rtc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] rtc: pm8xxx: Don't fail probe if the UEFI offset variable is missing
Date: Wed, 25 Nov 2026 21:50:09 -0800
Message-Id: <20261126055009.758156-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07c896 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=OYn6iJlKGZJMMuh0WgQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: JvmzNVqoVde5oRPnNYjFgUnThJJPkzaX
X-Proofpoint-GUID: JvmzNVqoVde5oRPnNYjFgUnThJJPkzaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX9N1+I93zvuG8
 dtkNkvgQs2sIbKg/NoGWzQjzQCD2On3nHn/LbFrV1oEfECrUT/fT076CdMuyxIuUcAguVKDX4aL
 zY8We3ZEMxCdMY+XEn+Qe0of9DmQwrTUtWYaXhnpgM2sioblEgUi+DLgTEAYSEgg0ZbECxtv+SU
 2soGqinaDrwAJXAVXkWaP9gT4mY/sk3AbtMbeO1ffqIi164Q/wZ5cAig+4F6V0UKek5abkfnrpL
 +ObLv7ggXWxkW5szmQ+T9M1odf6mzbucyHwLxzhhctXGpjCBJeN+lVEkgiNexCcy/UJ2CqzTXUq
 63FUVV/xjgTLbM00YJMlDm9kHm4vHzY3H2ZJ7fawEXhBfukys3pu3tLIzS6H9scIkfmj0hYAaue
 MSDx6NFATUvZN+qLulSAs1kZucyv5PtYq/IRlWapTjMzstyAapf96xYdjDYWWcGH0aksNs/DuWa
 y5W7u768koMGraWKExw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX3skUrTs5dn5N
 0o8AOOiLPbSufu20vnMT7DiPLUmUdAbAisnTRWvmjNdOacqHUefo3Mx0D7n8Kx/WZp1GdFDi657
 RslFWHjt/6wbk35A1pK5uMjtpmrvWAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

On boards that set qcom,uefi-rtc-info, the RTC offset is read from the
RTCInfo UEFI variable at probe time. Not every firmware creates this
variable. On the Microsoft Surface Laptop 8th Edition the variable store
is accessible but RTCInfo does not exist, so the read returns
EFI_NOT_FOUND and the probe fails:

  rtc-pm8xxx c426000.spmi:pmic@0:rtc@6100: probe with driver
  rtc-pm8xxx failed with error -2

As no RTC device is registered, the time can never be set and the
variable is never created.

Treat a missing variable as a zero offset. It gets written the first
time the time is set, as for any other offset update.

Fixes: bba38b874886 ("rtc: pm8xxx: add support for uefi offset")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/rtc/rtc-pm8xxx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 40b6b62116dc..747fd81c8146 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -109,6 +109,16 @@ static int pm8xxx_rtc_read_uefi_offset(struct pm8xxx_rtc *rtc_dd)
 				     &size, rtc_info);
 	efivar_unlock();
 
+	/*
+	 * Not every firmware creates the variable. Start with a zero offset,
+	 * it gets written when the time is set for the first time.
+	 */
+	if (status == EFI_NOT_FOUND) {
+		dev_dbg(dev, "UEFI offset not found, assuming zero\n");
+		rtc_dd->offset = 0;
+		return 0;
+	}
+
 	if (status != EFI_SUCCESS) {
 		dev_dbg(dev, "failed to read UEFI offset: %lu\n", status);
 		return efi_status_to_err(status);
-- 
2.34.1

