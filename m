Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E922E4257
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920696; cv=none; b=OsnbIruHtnZGV7ebvdO05V6mom1O5Z2nFaoBi/jB8FNIl+lYki8bwq7k50BSECSb/uY9Ht0tfnVe2knMe9KfIBdnJLUnH7QJyBZ4S7s2D0Ojs2bjMxyWPM0D0tmdLVdizrOs3m80OTiLjz7tr8nVVt44Vj2Klx78G7TI9fNsMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920696; c=relaxed/simple;
	bh=ak1t1Tww2SU+UvWrfCScZHknIDQup5S/EvFBTi6V/sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrYmNqBMH/gvWi2HTGrWMuunweH8IP0c/RRpvvH6bdJF3KfzMdauTkDttT+YnC7xR+nQxlm4m3GeEMVRHuFwZNllUz5VrcZNQa4khRXNsbug2c8MxfWcg/xyVfv1laWVjPsnp3xv+3z2eOWRjONM35JTYb6obLoDL06egVl7/RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3r8H9wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3dTkKWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3r8H9wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3dTkKWC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7rE92152727
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UU9XZ2HrQHQbBX6aVhP5UDIGMZ5towmgYqYL6QoFJxk=; b=h3r8H9wvSd5PGmZI
	OSlwFGPvMtwqYf3sb1lgD4JdRfaPbB8EwBTbfy6JizMziZ6Q5eNwaMWrHIMXomwd
	z51oyutIGvLz1CMQ3exfDIKh2BMdZHjk0ZyHZoi5UeSj9+K3GTish/7qKOL02dzw
	0v6p06C/oQ247yW8cWZqVWoel4r4AU5fT+2IaMxavRrpW2DiFUnVtxjYXKCP1V1U
	o//GIkFfsRwIgplx9UglJQtiA6SDVEAedOj0LpZIuMYleVO2EhKVAxlSf1hPWMFd
	PC/yqpsQjnrT0mY2tLjsyIfZPcaahKrj31FVvT6zojf1n46QZjpkS2GhbWxSawFb
	7dKyZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r9r1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb2a46cb5so22500541cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920680; x=1788525480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UU9XZ2HrQHQbBX6aVhP5UDIGMZ5towmgYqYL6QoFJxk=;
        b=T3dTkKWCL0wXE4OA8N/CHszRZoG+jPOfmLkLNHv9mF5+3hR6VVKsnWk/LqC9NieDdI
         nCXRFDIvx3dIKWHGwr4nFvfQMM7aGXmwwMYVRcKxqMO0ckpa/akIsMYh8DIW577Rj1cf
         CBVSl0ZpMyngpEegHCFl6MpkhkFL5p55zbsZN2u/0q1IxwRWW3XY9IlvE4c/PVLzWMgp
         MgjrL0ujg9sQ5UFcQhFhuWx8CaP2j70QGtlfOfZo7JgJk8OFNFsuA8XkRxzZTifIXFI/
         KisMl3IegFjvgxZzM38OoJ1JU3cQKTzck8cOD+X8zl55ycUm/bIiicNrqBdgaKnfQSCK
         AAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920680; x=1788525480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UU9XZ2HrQHQbBX6aVhP5UDIGMZ5towmgYqYL6QoFJxk=;
        b=Qypif7F11SE6lbqPYBBsf/UPcIs6/8V7NNOsIaCF7gvrr4zPOjo5AeQRWFyV5cRe9i
         ve/BXM0JdAe89IrGSTwRfuytE+S/OPeWQr4tfrusEmMrZgzvR+OMZv5KbSwEqe4B20S7
         IUbG4B/CRRPSvvnYZg1U2Vz+fcESXI7X2YZICMLGAPTC62Ude9P5x5K4avwj0jGnlZbg
         9CDkbWsQMV7fIDxbiLaqBZ4zSOoz29sn9svte4OtTKIbbhoQtOXCWcp5wdkQR6i3Naqr
         3FqyQqagwGs3T+pf7xmkJt/SGT4iv7XlkHqDWJUFDYdaeDOMwwTFox6ndFs3Bcz5B01V
         Ys9w==
X-Forwarded-Encrypted: i=1; AHgh+Rpm/EZU2RFfy7xCM9o43KfUQi/FhU3wOJV5ZOSyaFhLQsgJEkaOywyYK1JL15kg1vlA0qd0UqViqCpzTA38@vger.kernel.org
X-Gm-Message-State: AFuF++kobu6519wsEFiIjymlBLpkUcNSPLRoSl5D72pITDHowpvAYL73
	EUtfUnbOLP+BEk4ZKe3nItOb1M9LTxxUgO4BJnYjP3My1k7uI9/SmURdOSVioQB/yWk4Jm2LOqp
	oMCu19HzwXwMZ0i3CJ83CsMCXExtzNAPnpA8DleqD9+p2i2l4v9mtuX50UUk+iuMuXyBy
X-Gm-Gg: AR+sD13y+joj95Dt+rwXCw5Z+eUrRfATVWkY2wmM5IV8mAmhamjFAai9+acvA64zmPX
	ZstYjjfds7itO0ZG+xzzvUlWsosr51vrURtGDjHFspuSUVgmvfliciZzfYeeMYGjiP9a64dXMJO
	tIHWs0xTnXxAdTHvwP6hmL/Hrcy26m74vHO1PPymOebVrksuOySRoMjaspLQQsbqODED7rFGCRN
	tTZCfSGJyiFagzRddU7gM+ZC0Owo8HZvdtakrjxTiUJ7cTU3D7YJjMlacxTQ2BQz4AWTrQKFK6E
	HT25EJIeN3ZD3BoTq47+a9yC49oy+BNwLR8mpvNjgeHfM3pKHpgKiwC9/m77MuiPrOO1rmMNypF
	r1H6P3uI=
X-Received: by 2002:a05:622a:164e:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52fb965ec83mr65474441cf.38.1787920679508;
        Fri, 28 Aug 2026 05:37:59 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52fb965ec83mr65473751cf.38.1787920678960;
        Fri, 28 Aug 2026 05:37:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:25 +0300
Subject: [PATCH 06/11] arm64: dts: qcom: kaanapali: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-6-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ak1t1Tww2SU+UvWrfCScZHknIDQup5S/EvFBTi6V/sU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEP8HEzJ7PHwK//kjeDAeq71VynkaVhpOlmW
 D+YcGa2ovWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBDwAKCRAbX0TJAJUV
 VqvUEACht6OtfjUUwRWmcm1GbNW7qq6n9ZyVAVStOrTf0r40OCrlL2juhBCa3ow9rzh5YVkGH98
 NcRovg236fWZm5jktlWh4YDoMTAZ7OdaK4nOAopK4tjmSTtF3vq7auFj6ZR/oWH8ZM44l/UEJAR
 YWU6TOLZHNH0T+142El4hhs8CEE0bgsqHmYgs6oMyBCUN3KZYAFZyCO5F8VFbFN576U/4GFV/h5
 uJoURzvPZCcLNu98j5mltWpNYNfDIxjLq2+SM7GvqUOCCu006HGESuN+oHsG0tZebU4TRAozEBH
 5rKI9glfZOAHzSkq9qDO7duUGve+gBkq260h/HGy+pa90ILGZXAZwAe4mBk+p/Xnoppeye9z47r
 CH2qSv9MLTSbGLFjIUVPeQPQma6BiuNhm2hMbcszDVyXqVjmckFr24cYbD7UhOt6H9iMMnThcBb
 ZFEvR0m5844zY9dehk3IRzrR2R16PYWFA6fhycq8NoNSlJUUT4hYGoD9RZtlveuKpITDl92sdf1
 LiLRM8DMmy2GWuPuSHIHJKqmRhgyOMRV6HJjlXlzrGr7b5LvOkR+wB7NkBuMklzHGQcgINgBjZZ
 s1tnLOYbZBf/W16rdz473i362r8gMfD68l8ciUlZ1B1GJpuoD9nYl874W+GPfY/m5iHpXehrr3t
 gyWJ7gJmmedsChA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WTbW10FQVrqs2_FbktE3gZTabnFnB5a4
X-Proofpoint-ORIG-GUID: WTbW10FQVrqs2_FbktE3gZTabnFnB5a4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXw9ji94YVjwpt
 dm+NmyTmfV+QQyPFc6JYJjy9qwgtJK5YXbITwA5kvg8grXjm3q0yGP8FQP1ixevkr+xJde2T5kG
 qdUMnVZE/pu3gcj8Ee5ySW2n1lgSu+OCjyJJJKiyEhJ66WJqfsq9+hEXehRggL7WHR+l7WWZYUV
 seUkERWAGodDnUoM0Fig775xljZD+3c5MNDc+d03t4Bkiz8ou1zQENupm6ISkj8nI2QG0IxVle6
 SBm+6XIvITp/sB1zdkBfxV9VAe/zQwmxa67Sxi20HdgFZmJTSWY8KB3qFE+d7lAiRYwng0RFFer
 jVFiANtF1eXJG6noe5Z8b3UE79hM69wtNAkRElAeERIpYnxM+UGraCCyXrm1PtBRIO9ZpwjOlzM
 BfFIex5H5V8HrYfEq31l3RrvZ/jqGw9p2dUtdFVrnxThOEqSA9iOdlCmXd59S3ENR8TMMQ50mYk
 Mo2X2Whp7ys+IytKWKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX+xVGESVVcuU2
 j/rLFenzBRItzrt7cbh4hCnFhgvrybI0LaM1hLflIUNqqKKSX4zRNFl3eVFsrnxTsGM1S+pcoe/
 8H7DksBvfDqerGFKE0gOwKp1HR0S3YI=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a918128 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 11b48f6d5ed5 ("arm64: dts: qcom: kaanapali: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..f1629889354a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -908,6 +908,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index abd3e9f8a3eb..1560717b6ea1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -736,6 +736,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &pmh0101_flash {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..0aafb249af76 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2619,6 +2619,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

