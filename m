Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550538;
	b=H3oAZj5i099RANznXclp5hpj4Jgs4FllRRcFq/4zRYSuSVsKlgC+FZ1OTWT9/WandjX4
	 /NKsn+7RneTBC43V+nhsltXT4SrFdF4H5kfiiWnoxGpdZMVWU/gkzic+kDkeZ4uBxdsbm
	 hrciWuOPvOtBPtwiEEutrIe9UtskZ7FDCd4bO73AYsw+kLAbSrPZvQfeMJ0KkzwE21Lwq
	 Nvs6/rQ+eOk7I8c2SiexifE6fow6IttoyYNnfkFxoZ9w1uOuVELB1DyXW0yww2XMqwqLr
	 ysKGxwGrOzheqpKmk1TNwYna2BaT+NNgpeM2m/1g4nNYw554q2c8SKaj8ZEGEAKjcSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
	b=x+bEDbI7mrNT4qrl5DXrpHIR11arzYR6h3KDE4keypC5i4OsTOcNhSIbW52TG1kQK4ei
	 kf5q14oOOJGMpwKZQwRjKTA7YJokrpaMZiiLPgRcEM0hjYnqptxoiBKygXDC6jMz8snvO
	 p9z58UI5dH5yVloEf4HMosO8pSBABHa4mbbCk8UOwlAli71yZBZDff83rC+QhrVHVuHiP
	 RQoCLkJtV0TtsVktGKHkULVFjb0OAh7WfVB73gjHtopRSWNt5Bdo87sB1j3JNOx84536A
	 w0OAZ1M9Wd2trKn0cBhDSG2KZJSqruekUJtTJtWAJMY0XF8H+F5R+njCy2+/F9JyyOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8960A2608
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F8960A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3fp15zK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ixQDEJ+U
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXZbO2132755
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=; b=i3fp15zKSnYDtfXL
	12z6eUu4/VTtjGc2lcePyiRftP+y61UDo/+pdLMNaGNwYcd/TKw9SgQizYgxJoIe
	lfWeNQEXGsVa3FdDN5IqqSx/zHZGfv5Il90dCdpUlK+TOoQ9hy0AgY+k4gaaCPyK
	BIMYh0/ackSVhDz8F/Lka77G1RDzM6dcH5kiunCEtDnT9xa8aFYV1WDteRS1KT5V
	0alo11H6TY/2h0xEO6lMSCyRqQObC9BuuH3XsbFRmnUUn4crQ+NCPKcm2pw5NunH
	ZZYNNZLCFpflGr9lG/WUB405kmPWG+8THdm0Nwv6iRHe/iMPVwDeoyjr9QCW/xMR
	cEpLnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b801ym9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso58369985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550537; x=1796155337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=ixQDEJ+Uq+T+W8OUIEtBUMjm5aQ4+HEzuyThNyVxQIQonsgavURzKyN9NmortfJIQt
         0Dx78KJ1sUICPxrsl8QChOlIb/rYVDuQao7w71J6R5OrCLDznmzUbuxRmvfAGdAtRowO
         upciD05H3e1oCVrqt7EhITHV84xVUkbZvFEdbTljnk3a+hqO2+9nsDjssgmGSddw+tD2
         yujYzQ7WqscaUTMmKr6bfXCALs1NzCZPeCHwAsh3t4K1Gu4EmzuBvYzXm0afxw4C2KqK
         bMZolIahlZKqeBOF+uspsGn2eWp/nhYFhZpmtkNwtD95Jr+hfWXGRq0Jkp36gtTDHgsO
         3yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550537; x=1796155337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8XQanJHLa4LfJSEVBxpP6zVw8RfmcpdY5E7KecVeSU=;
        b=0ddan+2c3ayyy/QJPY1a41lFwLMuDMVQV+cvkfM/P29+qkePJ7gQWT0wSXN/dWutFQ
         jb5KyKUbzmsZlMCgA9koLOxBfdOYKc0ahbLkG4DN9TI7kP9o9ch13HLZi6q4sa1S05ja
         vAVrxwoV0ajNx9/wIOAYzAvBRQJEF+4/DoAK6LeYm2bFKKE/SxGhuJGumBnuu5BCQYZo
         Q3JxwSU2cswvJKlz6z3G58zpsZs/X4/G3j8KSswYVslO7M0LB00lJXUr5S/dGaHcw51V
         75QlCyWZAwcqkyRTEv0D3lIGwnzZWP4bPySx1TrLIUH9rcNDhAxoyWQ7sv8lJabHObdO
         tdXg==
X-Gm-Message-State: APuU4Z+TvEYYiWQSjkQuM41K8LU46iwy5fMR1KZLXAKabjF5OI09S3QT
	0io3jqw4SeT+L5nxbDKFChg9WqcMg+aWcTly57JhvqouoohnOufdyFjSxuw9+kF+P+j+3i8NStA
	fntIlrMSSf61+0deIQ8LOLtBWb2BpBNJbAf04x9cSStlyWTUnqvB+EgfHqOGsMJWFucgb
X-Gm-Gg: AZFdTZfBNieC8+Wd6adtDo5QieV4uODI6cbEcWz9p38Vf2aDsSqushqzlK4AWAMBOFu
	lJGZWJEDvWi3VTHnh45QgxFla4scskVuFR8NVc/FlyoL2tqpY7Mh/MzPpz2GQI6e8CCIrdwLi8G
	wPgkRa31uGyjCiwPnS/HygZ0h7eFduPouKkpaThzOJ9knIHmwnle5Fdhh+MMbd+I6kFz6w2z+Z4
	gIMvofskkpy86q494DdaHp20QJnN31vQF1/4VG5rHSmBDcnChF5D4KPQRz0Pw8jieSZe8vqC0HX
	NMQlF12elsgUSGNrMA+JNmC40VxENSj2tmgfv+t9jmkk9FQ8Kl5nkqCbN3msquVEMJMVXe5lLZi
	Xpjvz/vsO118Zl0nhKbhtSwV51eV5+8ZRsHz0PiZyLgVu2HL7dBNW8gPIzZqY2fAR8LyMpPImtz
	Y1LQJtKpA=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941330285a.2.1795550536707;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr2941322085a.2.1795550536057;
        Tue, 24 Nov 2026 12:02:16 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:41 +0100
Subject: [PATCH HACK RFC DNM 12/15] thunderbolt: Refuse to activate
 DP/USB3/PCIe tunnels
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-12-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=818;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=xwW3bA6llgOPKSqs1BeEuZQOAAAkb355SkxSOtj9lcU=;
 b=z/91Ffst28wbqwkdjx3GfJSrokIzn34lkqLhPQ0QHj3mOadUBYwq9mfP486m5L1tFwqCcuKFg
 U9LW3XliwnnCDiVva3RM6Kb1InyIgYlgQjJ+9aP6K43DNws8/DYTDtY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX9SokqeUAE5LA
 /quo3IcwndjDX/Ot1p/dY6xenmqekA1X1uM/VTFdeoUmmSShZfkPTHmAKrpp2EsvrxLX+grjGzM
 tj50kM4GWbABA7Y2KRO1w1C8QJZ9NYkxwqtBBk/W1ndOwNvkDHU7Rnc3D/F+h+Hve/Sf8tiHeaw
 fNyNIW6XT2iGkwnuS+5GYbwSpV97GD495dWAvJqW+Bf3WfaMahd7AY71hZXkLnFY5NIlqHap0jO
 BgA1JHComTd3hak2/fiVpayuay47bmCre3cY22LvzFSK2lHr04FqZuRzTVGRJ+piA7IRwiHJNRX
 0ojXPr0jc8Ya1KFMoMe+p1lXzDfI1DYKtZwXYxBmpHczus0X635F8wQ9gdmaldKupCR9XkA+wVO
 x6vv+JenpUBrBaUjfiuetTF3IEjmCF2L2uZ4Fh6xYwGxayD+zmMWAB4etIoO/irrPNQ7bpNOmTh
 F4YTHiVJKdwi/dmAWEw==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05ed49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Jr2PhzqEZPgRj7HVupcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BW9ivJtK0ueWfsz2Q7I3OJHi7mQ3K64o
X-Proofpoint-GUID: BW9ivJtK0ueWfsz2Q7I3OJHi7mQ3K64o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX/iSUlodZt0IX
 HOadxITHusUAnXCCmA2wBLuYSKjYKDlF30ji8Eji0t6druVMjVCU04RES4KmVAXWurAyBFOFWSr
 ASxEpeadHf9BR5mTueZqwxb7R/FYUmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

This is for demonstration purposes for anyone wanting to try out the
series on real hw, keeping in mind the constraints detailed in the
cover letter.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tunnel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8145657835c5bb060812770a303cbf2649082a55..8b497da596b99d7f9d2e04636caa9896617af2e4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2430,6 +2430,8 @@ int tb_tunnel_activate(struct tb_tunnel *tunnel)
 	int res, i;
 
 	tb_tunnel_dbg(tunnel, "activating\n");
+	if (!tb_tunnel_is_dma(tunnel))
+		return -EOPNOTSUPP;
 
 	/*
 	 * Make sure all paths are properly disabled before enabling

-- 
2.55.0

