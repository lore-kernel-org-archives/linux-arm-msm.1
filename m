Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273730;
	b=OF33MquYDN7cVS/lAsWgqczNtUx9l3W3+nT6GIkFuiUH2ghRWk0vnhsXLsv+88im/R/U
	 oNQ/VXYRMQ1ke1uv5H2Z64Yb11MJoYuvcsggaZkWHP8yurmUoX1TShF20b/ugzl3J7p5b
	 /esdCY8bw8LHXqcS4LgOOn6DZD8bFW9ry+uMNycQD1HJsws8jQ5EoQ3JO1k0Vd4sdOqlW
	 7wLePcvlBpmUyi2Wn1Mmb5x8XXtuOQqdFwWtki5Moeoc2Kuj1gWERzCfG469RNgj1SchO
	 a+UXhTUEcOKdfitTVPuzililnqtN0UOI2seXCGqSFTO4gzDwRb3f8ylI94A9oJBCnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273730;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
	b=gGAmuKFcXwRafaYIH13TmGQkyYr+D06N0bpTCSpdzAJRucVESkpstoBHRJblogloNNBb
	 xEM+q5slRqWcHR1zq1m1c3PayAbYrpMPmfyyN1/QhvDhcDQNK5bBpOlLz0A6riIpyjHTY
	 RIMJiBUkj/Aa2QWwqPSlgPbBbLq/rMh20Eb46jcEyNPFMi1w0fdbg8nOnVOpND2z7d2b3
	 P43PwwK+SYxWIv86WUf/9gIA0H4eI4x5ttnkMdxpHFE8vYJzEmJQ50/7EXMRFrptINnHp
	 D5U3u/Wx6+MfRDYqejvwLKS4t54lGK4WKEIGWxOLtFfqGSqNnVPOhS3+6YmsuLD7trw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ks5uzx72;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nw+JICvU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BE606A32E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19BE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ks5uzx72;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nw+JICvU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jGxl237149
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=; b=ks5uzx72sfHyikhi
	PSIzhVv0Y9oG+Pw/MB4KISgSqt7mZFsVfdyYxO3jkdQJ5uCFIWRPyqSYrD0+o0Sf
	xwonhsBbjK2HcOGbJDSz0cT7tDvY53ca3WzgX0Bsbdm3KNVimOxpOm7XizwWqBYJ
	nsafU821axWY2OcVp/QRkkSF/DDd0OEYvYofDs55oiuYXSRS1btIZaDIAYQl2OfW
	kZg6cS0ak9GAlOBbnIEuJ5EwC4dBu4eXdprI/x53eF6D0NK45dLPz2f6GjLZ6fHC
	03D4TzCkgh42Z9wObg2ruF6L9Mzvy7IRxz5o2gsADbXnTIWa+Jj0b5QNEIswl3Jc
	k0tCYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8u4qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08904845so22860435ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 17:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273728; x=1794878528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
        b=Nw+JICvUhwLaHyCFRJDnvvg3vJOjxlSxKLturTfRrv6JeUvuS0576qv2TbsSFSh3WR
         yHX5p4GRPvFFTXpcBxajQT7gY2c99bwBrx8bDrLAl0v2noEGuMJZyMUe1/HZnXjvAMmE
         m/pnzPXuQGObS4HD4KW8gDan5IHasn8vms9Z6cW1wOoaNziSLw/oSOD0MfgQB0ZBZcsz
         XdlPBuso1X4UAa0XkaYMuZTXT9WbNlUA8iW3VmmyC2HViCsjZMfqMzfffyGUfFM9b+40
         7QiEhB+/Yuv/dapGz+affmNygN3QRdc6OsXwiUkqiMbIaqsZkmHSJXbprk7VgdZJmdu9
         MJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273728; x=1794878528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ri5LRQCz6HTVZxyjEjf9ZvyWc58z5OS6sfdl8QGMOI=;
        b=s3WtlaMlxPCMF8ubxBG/l1qNeiN9AGVsp8NNLTs2OFttE6Y6gKHvYqrlebxSyL8TL8
         jTKXbkQa5dxoQA+LIkUM/emrBXRsfyNQcJKKPu1qGUhuWgrSWH7NxY1hoj+hasmlpKhZ
         8TjGgcyga+W24ofYUxGL1X7iIS1PBjPLU53/i0opnpJlMYdBlYZNu4o7pvjz0gpPMt1H
         tuL0nAJtNP6BqoOFbDMhmpOtOAXH1qqn/aRK+Ja4gxYZ9LNUActShNUruNvNGeGRJhmq
         r3UHBgqgvqCVNZirsHzo4fj2CSNrO0MUlyzGVVTJdXVxKWT2ExLj7js7kmoqjTv9afOh
         mQHA==
X-Forwarded-Encrypted: i=1; AL+hErEs7NBjR6sSAf73PTgKGSqm3Xs7lZoxCXPMAAAx959CO8uzy4j9gbVK/a4XKPL9FiBeBHb6mKi4D0YFH9C1@vger.kernel.org
X-Gm-Message-State: APuU4Z8Eu9PhzzMz5uCJ40R83rFm/+ufnY2R21aD5US/67NrVJis6Uzt
	0ELzoN7Y/vZvUy3YQZ2slu1S6hFAQS1jgu1JfE7ocQwwJQlcji8jatBon00FAYxVf4dDT2OHGWE
	qbS1jcKgF4mjX7WU5Izl0361+vzPuzPKsH7s/tl9iOKeyZKOw0sD2kRPzPDsug2NfyPxv
X-Gm-Gg: AYBFou0j5k1kz7D82WK0CHqSAq0cqPxZwPzF42zfJmKCh1QmublKJm/BSn3s7dHR0Oo
	MQ3jbF3imNqics67mjbXbuu67EBx3L84XCbls2EsvZT6PFNKPGbBd+mZ/HafIIDiTYwEYlvJM/X
	Cj9c45wQkdZzaq73WochoBwieTdggvAlNVfFwg1na+qwF5bpRZyjiHZtKSstqJ0w7FlhpCrhnxE
	gt/KVoeAc9PpeGBEA5UcYOwwQFLsgLi2A95qYLRIk4M+TPwN+JJ2YRO5o4MyIagJw0569BB1UZH
	skTNfdPyA6OZCuKAQiWxX/JjMbWqiKClmV9PYpP1UayYeVR5vHNiEuuY/s3EGIMN0EoiKTmWtUM
	Pvvjg+9y/PItEkiHDrYQ06xcRjArQSVZEFPs3Phu8REnfLntAoJ5/GJ+c5QuYyiVsM+WszX3tKv
	QvHZegBcLkPMVPzr69xEMrA+a2fOfze9hXo/4=
X-Received: by 2002:a17:902:ec8e:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2edb8f92cb5mr9829925ad.5.1794273728344;
        Mon, 09 Nov 2026 17:22:08 -0800 (PST)
X-Received: by 2002:a17:902:ec8e:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2edb8f92cb5mr9829585ad.5.1794273727903;
        Mon, 09 Nov 2026 17:22:07 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:07 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:18 +0800
Subject: [PATCH v7 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1759;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=rDavMIMltT2mlANTj80zr2Gtc/JIaNOjwXPyFgVLGy4=;
 b=qsRY1qzG5WPB4u2KTWjUNyIaRgus/vUYLvzSEQts5Yw5DwIacin+H9WhFx277CKwer9016nC9
 lMORX9mrWM8DzlfNouoyUmhfHmU4MmV7WywPUSacwz84NDiZYWAfUy3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfXydwp9kg0pBrg
 zCm3Gilwx1rJPnzFFCNRlfzPqKG0FwyCu0Sf3n+cxImfaI2y2fuNvCP25+Ovg9GMcku5lrjyPhV
 ivdnjfzcylgq8ABrMLejv0RqpsXVB8I6u0jrBxjQU0vAZAmOK63mRfgJTetat48D8QWKI3Hr+mt
 QIV6O05ELae7IYaeYBQpaFNf3JzUqX/W611MzxBfbMuOXtfTDlWL3vXg3VZohwXxBkAhZkDeW4O
 z6ffeKAJy5cg+0Y9Cdl8A+jajIUM+xVW1I37R8lU6O4TwfHWrcDjpfKF3+lyWROgJm7y6wgrL0n
 zdJ6HuWj7RgE+G1DibADhzwKtaxTrVrL4MAQnTk6Il9PXTP5K4AWgzYrE2xhAoGI32hzbUuuZp3
 JmQ1l5K4S+pWorktt9gmZaJdAwmkHhHLonIsn2pB6wai7OPqEshafOzTJX4OCCu/dDI3sfSv8bS
 K3stTkfe9HfWPeyr8ig==
X-Proofpoint-GUID: R-w0u-oQWm-XQYjCHzDcVMY_9XKdWg_3
X-Proofpoint-ORIG-GUID: R-w0u-oQWm-XQYjCHzDcVMY_9XKdWg_3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX6f/ypuJg+LBi
 p+JUZQGgJI+tPqRm3W5YJzfdctsGsdlD5eCLN0s9TP3BYmw7q2LGZp2YK3/MzDHwQQwfKzr6C0x
 37ShSLoRC230bfzg/Ot1FnKcdXT3JJk=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af271c0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
the ATB sources within its subsystem (TPDMs and other ATB masters) and
forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..d94068aaa342 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7269,12 +7269,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000 {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

