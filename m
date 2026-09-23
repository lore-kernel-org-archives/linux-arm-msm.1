Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CECD496D58
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161386; cv=none; b=rq1rM5syI8cgDUdIJ5IfigfzmsYIU2lNUsJFWilrqHTM6oA1uVV4ufz2W+Wb9kZOLnrUcBB2P0BL8DC8qtQ0XXIfER5LHcLUAaZpLJog4jiZtuSDNZVdX1toJgO+2pZqO36YQH4r6WjFBcvNOCHJSQIEyf/asHpwM/paceC+Rjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161386; c=relaxed/simple;
	bh=dj2HV07iJbUKgotIBkxev1vjmCbbYX4o6QipMiXBuws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfWr0W6+RJNxd3QLU9MaanyLksNYpZJTk5ktzf5J6ecAlxG9WVfUvxv42Q6NkqLdlFg8qmcoTWvqFcU++1Qr3ZUHRHjkSSBvMI92eObMH22KHftftjooliz6lKryLQdxyvTVu2LWLFyL9Fi+rU8LGLhe443MATq+0NrXvCijjfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=no/e5dMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOOrEg0J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="no/e5dMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOOrEg0J"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2bJ42236686
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtSfTBfPvgBFmUK6LTNNqXLD4BtNlVBQw/rcqNOcjZc=; b=no/e5dMpJxN49WtF
	0k046cbxoKfTfxoJUL6U1HtZSsrtNVO5sPp9mazMRp/UUq/wUsdcgU3aTFFMYJD5
	2n4QbKUbXiQTLiNnebaJ/HpuOMtyREIMkOMgN7/mwD4CbAUkm3yYXDlW04/n9b7k
	OwH3toXo124U1lGay1WHD9HdPhaZGlkQt5wqjOzoxGnTQ6JhdwO8UYI6J9XuAQ5d
	JCFRNuzywOTBj3K5OOTSOwSXJF0JTD5UFclqDwYAUkAnYhYs0Nn9sx0I4P33JJPF
	8dQQe70gW8KndqLjx80T5m2IO+hYzVvo4EYXb2OJRVyAKmh8wkgr90eLNy04CASB
	z+CH7A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7geyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:02:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1363119eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161376; x=1790766176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtSfTBfPvgBFmUK6LTNNqXLD4BtNlVBQw/rcqNOcjZc=;
        b=cOOrEg0JlpV7HIDkWU9BdprPV0lzMRI5EKh2LUA4mKDTvHpJiGQZn3Q5mIkO0uzllU
         LGk7RO7oq67PB5pPv0JsP3sTUDQCUCiY299uyUE8HGOzPTQ5eea6pu+oC8eXXjmmJgxM
         kbQdQiborvLFlaprrWctbeVCp6RQVg7+U7jxz7OfIQQJW32FYkza1u3LUtWl1R/9KMiW
         qQsIDvHAPOp0lbFuynOB+8TLQvDqb3HpdwMVbgujD/mxK9xAbPbJoOyDfKj++FVYEmBn
         1wI9DmT3DwjXCST4OC5icOGEOkCw452Ax1ZahyAoUw7q7O7s4dv3RuyqDdV1R+GX0d31
         ASOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161376; x=1790766176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtSfTBfPvgBFmUK6LTNNqXLD4BtNlVBQw/rcqNOcjZc=;
        b=ECcGS65n9U3RyJ+UNhcBgs95F1k+95GFKNsvYhhCovRftZ4nvASZl21krbJK4tbMZP
         J1sDMvM+NAunzwoNAelSkB3T8AgKxvchO8njj1BNZjG2CyP3Vr/VqzckNkK2IxcLtGVb
         4nBIFYvNGy/0sxJS6OxtEQoHp1ECUzVKbD5Auza3DJ0mdB5Cp6pu/MIyQOW4DrkOokB/
         DzkbPaNHoOEQLBbTgFN4gmN2rC7kEWu2xcfqZk8nnyVR6nsq3aUqI6AcgDE230sFs3X+
         La+d4tcAIEL4Yp+nrA8HdXc5H6eST4Zva+6Kbn8rKIKS+JgBr8LvM6Gh8aJhFcQjBlVm
         vQsw==
X-Gm-Message-State: AFuF++k3QcKb9kjL/oWFLfywJMgwuY9rg05fgn7D7vh/TKvnClz/4nNY
	YfSMhcXNBCuZZYIap6UBX0Wg+Uwdi9PZzk0WFrXhAtqvgXaBANn58IYqutbBqjdF62qt63nY3nx
	O73mOU+TszGE888QV3kGGwNLRcYjNWKEYgm21cB5mQwPcQ7/uI03FyKDBM4BZXy0R9Ael
X-Gm-Gg: AYBFou2lm/fBzO4+bIoNbWPbP+II2EHB8Lwk9NYd8bpC2b/b4mljE7TPVA1rJv3Tjz+
	ZzIbZJXhGzv/5U8+qtdkoEtBhcSZL6WddcEwdScAFCNooDqldW9gHFNhvbmc8hJTRjU9JAzSFnV
	meU3tS2pO2C/AuLxSyFNL70mBinUzOam3VJXo1FMiLpJWSfzH2kI5d3I7oYG4HPODip85pSLVlM
	GhUZD622+gUJyTvd/KOT9/kCONMMp5aaC/xE9sUWaxvUDomUwnA4AuRWE5JNRms8XPd8EulJeEG
	P1cW6brQkquvoVoLuzxDmZNk26ZOAl5z7m4UnF2rt5/tg0q7LnrOybYIm5qQY2BHXtFAe/2cquG
	qssTdaWp5Cl02SK/+J0JxS/5MlLj2iQ==
X-Received: by 2002:a05:693c:8950:20b0:314:75d9:4751 with SMTP id 5a478bee46e88-33e8d9c90e0mr2160991eec.20.1790161375570;
        Wed, 23 Sep 2026 04:02:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8950:20b0:314:75d9:4751 with SMTP id 5a478bee46e88-33e8d9c90e0mr2160949eec.20.1790161374603;
        Wed, 23 Sep 2026 04:02:54 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:02:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:32 +0530
Subject: [PATCH RFC 01/15] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=1282;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=I9K6dqyuKuWaYIMstHojoCWyhkP+UlD/jEvqS2r1WK4=;
 b=fMqMgUdgNqosHNWEGIHnXmLcwDITd899XEMhKFVmcURT/DeeJSNsCYQGmfY+mBFVl2QkScFJo
 RVc137fNrsFADdM7QQB1ic3h4k43RN362ju+kK00r03loSLaDdVp5jU
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: 3mTqO48axL2Ywb13CBICmvPRJdawuJD1
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3b1e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX/Yn2t+i/Nu6H
 FfGtATNkZYg4raxK66BukehmbQWPcXQKqtiYJhsb1DgjyERju/3sYdaEd7as7C+/VMnJ25UIRuv
 Jc+bW4DV1LUvpMT7MB769qPvSLyhtUyveD103ue96Otv+CgesQbW70+91z4qQ5W5T2KnJKRFuc5
 RhBqT6dQoKwgbcQF9hWAZf6OZQvTt3mPzyaaDUFP0islxHUl4UITwgIEssp+CeZJjX4Om3tv43V
 wdlQb8sqcKHwN1x9u9/ZT4wUbwTZAeA4XRzGqiGcQgpA6bqOrksPyKZ1HrE9A3PVJJTMye9m0Ji
 MQRBDSx+VZ3+EeXTi1YyBMhrbHkQWgfL/egp2Ohi7//ef2NTbolZvLupkeX+k2RlrGQ9i4MQPjw
 OG/A/76v1G7wpBCN+qNgaKpca8OTo3mbcYtpp11i4befChsKT5GVDNqhTVDiP69iGyUXYKvewkH
 U+C7Jo+BZH/Pu7UWauA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX/5E2ytdxmBvw
 cZORJYqG4JE+yobMDctV2RA3wn+n9VMrD5c4ju5sRH58kp6tFwTnDqxk3LxrTIjzmbQtuVKnlWP
 4bZN87/yfN85VIb8ftILEFkxT55VuJQ=
X-Proofpoint-GUID: 3mTqO48axL2Ywb13CBICmvPRJdawuJD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230043

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

