Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617646;
	b=GEp03oEgAFD9E3sHdAnEyvPjemkKgb3fsMPh6NJJfUitDoOQNdSLmORDuGSbTURKTZS2
	 FyNEba5mJcGzmb81MrREdn9+gwdtcNlIkTVNTP/Mr3srovHYn4z2i/Bduuhwp/iEOpKnO
	 uFQT1CEPtfj3KxX1I105yWtN9LYBcIVjqGVetcgEciPjJgcnJZQk5d75xGQiSsQc5RkWl
	 YoSOjGThlWZNsS/fNsw6+g3kvrQgisuHRZoy3y/0T5b54MQOOx7S/mkzhUUu5nzegfLl3
	 npoQ/MwCEGjW52xQbcnAFiy6yRsORM5VnTmAPNJVNBifzh+aZUm4XM43i95hCD3nkRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IomzRdt99bekLdCNuT1PRZtlRcbSbbUP/6u1Mv3ZjDs=;
	b=gD5sYzUeS6cKtIKA1xXRTk16k5ZE8DuxOZv3w/k34n2THh1gdn+jflSDJIAdzu3NslO7
	 SZ7TIHMmrsjRuzm1KUlGWCNgSJp2T55YrleFwZ6+C4YFBRvJIvn0W8EgMM13mhTaI00pL
	 +UElHHjkh9cET8WCN4rN7A7Ozjk5K81g1QjEAAgu9AllEladhxRzuqLvmW6kQY7+K9t7w
	 uIQq/B9IEH/eux6HMbdihqguEu0Rx6ZymlDglja5F4KKh55fhi5f4coSCK8OEmLLVrolK
	 KbsrqcTxyQUh4fRJk+oLanZuawkLE67COcRKkQl6hWA5Un2lhFyo2jxyMueWeNQk7EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q25XNqHr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsjFkGHh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E0606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q25XNqHr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsjFkGHh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299w0H3402412
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IomzRdt99bekLdCNuT1PRZ
	tlRcbSbbUP/6u1Mv3ZjDs=; b=Q25XNqHrLceOHR2astg/IecZv2nAFp6g19j0Qc
	3wAFIBEnhDToIVBv3hjEADJLGPa//4PXKPaS211cOMERYKkUYqX5VSxrDWFiPgDg
	+Zpj8uC4giAFZWhaGkMUvnTHyijsLzsfSh5/vr+0x1waeiH6kPWapyqXr/n+qtb6
	5Sr90q6XD2saKufr/oQEN1OIwJEOMWbWgUI+VkEQOKIvbwz9uWnmA0+8aRkumdTf
	tuHPVdRR37FxZP+aE4YEHXcMOIl35KFgczq3SvczYH48Gb7s116YkwFZqfdTPf3r
	28R7QdDAdlZeueplgvLYSdZxZGcuMugclTyJp/4QjhF90NOQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8srj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:07:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so519841137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617645; x=1794222445; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IomzRdt99bekLdCNuT1PRZtlRcbSbbUP/6u1Mv3ZjDs=;
        b=XsjFkGHhPj4XSuF6eOPN28/2AmKXnh4G/b5LL9gw9CTo44ivT8Fw3fkWYSOTJ7bd7x
         bdxXu6cPWlUSlh3EgJkJsxjUpKXQ/JyKAhM2z+E67Ty+iOwr51Gg+3oMOc7EDB5JC20g
         m1L8DS66qcxLkD90gMwM09xj4kRLxNTMmFD8niSJhNjGB4OeRCMZpg+Jpclpd/41TtF0
         QUlAyjADYdoGm2WF0ueosrCsYsj8qkDvT8jw6T8Ey3MRC+PdoBZ3tCRaFhq4oSq8fb0p
         fLyAfjJHqzZjrTu3BARrtTF7DZ5LsrLgsvWQRUbn2vp7cDQfARcLnhspC2a23jHoV0Bp
         RvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617645; x=1794222445;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IomzRdt99bekLdCNuT1PRZtlRcbSbbUP/6u1Mv3ZjDs=;
        b=P56DiTkuu091AEVdIIbxphX7qK+uDrp6Mx348lFTqVjL0R3PghjqA8btgtleLbFLSk
         k5mvvDOH7mDVx/JSAukeFwqv4pnRS6RWeD/ESY17WH0QMeIVR7CXklSbnhP8X6rer9pO
         78Ed12Duu6GzITKOK3o93M2qyIx80sHqAL5iiN/Md8KwgWk4hzL+mCSPn1mqEmBn3/L+
         wbgKyAHmwJAUTz1z1tG3tf9IN5i3WgIiZkwSHa4515sK/M+kVC8N6sU+PaX1xWuDfHJQ
         An1knGh2/df4EAgs4/EfKAu6t7/HX99cQaRR/AP9e6ErsDHDtbLtPNL0RENBzUJWr96g
         9JEQ==
X-Forwarded-Encrypted: i=1; AKwUvBycBQfyAWB3yFdPRCPXs6NCT9+eYNcP30Yp9a+dX1v7s87Bc8Dj6HoHNF2cblXFEntErZZIjhv7ARRtdp1Q@vger.kernel.org
X-Gm-Message-State: APuU4Z9FEgDNnb4VkigZDOSKOHIp7AJRjzkwhVSXXFcO8H75jDTI72H3
	OJnFnbPmtSv0pFYUTZimsThVApZpeapt6rime9ADt5yWBDhdfvHwX1ThPs0GgtylFtW5vJIcrK5
	0VaVqUFm5ZS+cejPEihZxOrh+2tx1Jet8ZzsjulR5P7Ui+AGCDm0NOnoXqYbX8gBQXsUR
X-Gm-Gg: AYBFou3G+ih21FKiQkP5thvETHxDH53Q0QQCHq3YTtd50BDEhdTTX5iBxTFSoPFjlGG
	JLIg3ff7vSUhtAJAaW1wwWeC5Sh1R/qSvqMlxA7vvrfkbzEiyvysEyrjoJ5oCK+ujY+Bl0qm+kI
	fimcsHI/VH2dBSOVsSOl8OXlqo153huRhJw2mctECcH+lENQrv4Df8xn0Bdt3uiUi2dci2aRLnX
	bN2VtdpTo3gNOklJbRfOhDsKalhzNYz+rOkFKt6ttFMYoVklZ3l6CXTHbdH26W85P35lH55b9OZ
	IfIUYU+MZDJbRnXoW0AV2wBNtuyK504uVkTP1+h+l5LLLzpAkcjfhqmzb8rUmoZ90cEDTrbiHEh
	+MRqZuR4uXdyiQCI8yNSlrMPICy4nAHHgylsNsuxLULoCx+nwX8NxBQVyFg==
X-Received: by 2002:a05:6102:509e:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7d072605b45mr3152855137.23.1793617644412;
        Mon, 02 Nov 2026 03:07:24 -0800 (PST)
X-Received: by 2002:a05:6102:509e:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7d072605b45mr3152844137.23.1793617643745;
        Mon, 02 Nov 2026 03:07:23 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm19934660f8f.22.2026.11.02.03.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:07:23 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:07:19 +0200
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Fix use-after-free of work
 items on unbind
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
Message-Id: <20261102-pmic-glink-altmode-teardown-uaf-v1-1-377d92e3b5e2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOZu6GoC/yXNQQ6CMBBA0auQWTsJUxM0XsW4qNMpjkJL2qIkh
 LtTdfk2/6+QJalkuDQrJHlr1hgq6NAAP2zoBdVVg2lNR9QanEZl7AcNL7RDGaMTLGKTi5+As/V
 4ZvbdkZzQyUOtTEm8Lr/D9fZ3nu9P4fLNwrbtBRLgzoMAAAA=
X-Change-ID: 20261102-pmic-glink-altmode-teardown-uaf-8ccf631de17f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uh4HXhNmZ/dbNQnpFph6ZfzvN/m1Ht64robNo+er9B4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6G7pH0g/feQCMez03Uba7RYPX0g1h14HOSBKm
 SvOkMuHJcCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauhu6QAKCRAbX0TJAJUV
 VgBND/4y6D7iGbNsOHfEcxKY3hqlFqI1Tch+fxThybt5vM46stYHssjyocLm2kY+pQdQq7olJGk
 73p6RjWxsL3JBkyzZv5iKyWg5TrRRwYU3EK9kgXwXg+dXUrlY4yq68nFc2M9d9QUdmoGRQnY+FL
 miNyLypisYtC4NfDkv8no+DusnfitW2kiuv79Lh32V353i110nywTmB4+VKsyM2u8Ey6eoSGK2y
 edfQXzMMSO2JO/QsclwS5HmnMsSSPBd3qCXKzN3EhsstdiPZAbohb3XIIY252LtKqQEoMTJBNE7
 HTuEKTfByEwJ8/evJkgEw/7D9Kt1qasyCp5nhSIdq7yAHIERfQ9h4BO8XiRO8WBYXfTehxxUz+P
 AS4cWZS4ndyKo8tH4ahMT9KGMbffdX7Vi8/gXM5kW6P6inZrv/YZB9n/gQjOPv/YwHLDtXk/Zwi
 Wl0ySplGtBmH7m4RyTz24c1uuy9SloROodU49SffmGHiesA83xSP/NkZ6FzyRl750BLBMZaGZEq
 Sh2zeVyPKKCxpaQhpwLrn0oAduOSGI9xcC4yeC5suQfOc8d/1gadinPWDAtClUM7JWWp4AQV136
 gojIeqzcf9dUQWg8+cVmDqT9lyQks0ROSVgI7L0cujXi0oymShvCDGujy1AfvG+1WA261sVlN6Z
 uQsGEJ1uGRUorIA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae86eed cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KrGhH5gZDbmhOXNytT8A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX5ORANnkTqJkW
 YnQ2+0iEKiqg7EJaMMjFRDPwmK5ZrTYFm5m3Ucagri3Pc+e29LtW1wNvIoRY09wGjv2poQ2noyw
 OPSfuybg4BMmuOAJd7y1ZfVjtSPoEgyHK4G4jt70ce06ccgRRszjr/GJh+n1t+643OoISb7pgLn
 e3eQGR2J6I66Ob0tD/eVflvxHmQp9JLrzerfmXvSThNOSSNouUPMQFdUEW/0KhOJJLvuJ2eAaGF
 zhHmnhUAKO5OZ1jrKUeuZDfjxMYgacNetJcis+GylcT4xU1Zg+8384c05LklNhs1EmkoWclRKkd
 HHI/kerqB9V4OMdb46EBmXj6Yrs8mj9dzw4kRppv1t8rzoDB2s89nBskeLOCnPkbuRn7QPap0Xg
 qmF+g0VegfsUNaEhT2geFbeAl6O59kqq7oCQ5L40RUo3UVbKAYbXEu4cGzbBD+lONfdo4IPZEQD
 t6wzMiBgnUHZOZraxKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX+D5J/63Xorwd
 nwdszg8/xBMspwluhGIWPTL30M+4C80BtX5IGUEuWfnmletlCre/kxFgkTfS5TdjLOtdZwXLdt1
 aGXRMk1tKNEP9ork7U2IE5BmCLB1j7k=
X-Proofpoint-ORIG-GUID: s27pnoV6FFvQ5YDneIstWjhr6z6cBeQr
X-Proofpoint-GUID: s27pnoV6FFvQ5YDneIstWjhr6z6cBeQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The altmode context, including the enable_work and the per-port work
items, is devm-allocated, but nothing cancels the work items on unbind.
A PDR or GLINK notification can queue them on the system workqueues, so
if the device gets unbound while one is pending or running, devres frees
the context, the typec handles and the pmic_glink client under it, and
the worker then dereferences freed memory.

Cancelling the work items is not enough on its own, since the client
callbacks keep queueing them until the client devres is released. So
register a devm action, right after the client is allocated, which
disables the works using disable_work_sync(). Devres runs actions in
reverse order, so on unbind this happens first, waiting for any running
worker while the client, typec handles and bridges are still around,
and making any later queueing from the client callbacks a no-op.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: stable@vger.kernel.org # 6.10
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-762f89d1-07b0-45e1-9557-bf643a826aa1
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/soc/qcom/pmic_glink_altmode.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..3f6d3290d29b 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -543,6 +543,23 @@ static void pmic_glink_altmode_put_switch(void *data)
 	typec_switch_put(data);
 }
 
+static void pmic_glink_altmode_disable_work(void *data)
+{
+	struct pmic_glink_altmode *altmode = data;
+	struct pmic_glink_altmode_port *alt_port;
+	unsigned int port;
+
+	disable_work_sync(&altmode->enable_work);
+
+	for (port = 0; port < ARRAY_SIZE(altmode->ports); port++) {
+		alt_port = &altmode->ports[port];
+		if (!alt_port->altmode)
+			continue;
+
+		disable_work_sync(&alt_port->work);
+	}
+}
+
 static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 {
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
@@ -695,6 +712,18 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 	if (IS_ERR(altmode->client))
 		return PTR_ERR(altmode->client);
 
+	/*
+	 * Registered after the client, so that on unbind the workers are
+	 * disabled, and any in-flight instance is waited for, before the
+	 * client, the typec handles and the altmode context go away. The
+	 * client callbacks may still fire until the client is released, so
+	 * disable rather than cancel the works to keep them from being
+	 * requeued.
+	 */
+	ret = devm_add_action_or_reset(dev, pmic_glink_altmode_disable_work, altmode);
+	if (ret)
+		return ret;
+
 	pmic_glink_client_register(altmode->client);
 
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-pmic-glink-altmode-teardown-uaf-8ccf631de17f

Best regards,
--  

Abel

