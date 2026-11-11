Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407406;
	b=eaTmet1whbJsh6z7ydlI5ZS3XhaVFfB30t/AE9gUARTyIGl4osdnjUOgPHF8StHz4FKa
	 oYnslWc1Nn6OF+aDsz3ZI6ZDO6RdM1LeANTx7lhnm4DwYBQMxlSsI7OoW4xreYWExmdTO
	 AJdWg0JXBKXxfJp5EcHpgXwCTtyYN1F+pe5GjsI3o6jYrJ6+Gj8CyKyLUfF2i0AdEeh2f
	 68vy//0MEX1F9/5WqrZh0d5txTu8ahv6I26cY3CpX4oQMiggVjxUJDk/Wgz1Tq2sXNSWm
	 m/SXRMUUf5/Vd2OaSpzYVNGR7iA1eULl0rlx3Ba4HLmSucHPrchGBE/8bNo7gzXypdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
	b=2IJ79/XYwV3Gw0Wn32cdfOvgf367z2MrNyV9ynj2cCXMaFzxv/eijI8mv1sjZlcdAXQp
	 lYkzqHQBTiWk4V8lbioHehLaIxVnGV/v27ztJmgF/F031q0s6biID6HDZmn4GOPh7wL3E
	 tCvcTz/TEHYzOe3X9+N5MEHIHtiOumRfVcfqzd8/l+RqEZjK5fMlvQWGjep+PFbYmOPbp
	 wQp2vG51QHZGMpBERdBOQCE/rLbPFXZRpO0F35Lv2uwHI4b69FMONU4e1zzCs7Lzq9cRO
	 iheu9sE37DwmJhzJOH4wFKnG7I/C7QzRr0jBaUquxlRgpdDI8yEFrutchVTPMtuIzfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FE1606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61FE1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxEl6DAq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4AscMPx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJbHh528261
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vGEIt+0d09kkbPmVgRK9KARC
	j2NgxxPeIMDPZW+376o=; b=nxEl6DAqnVqU3uwhbW4/zp6ad3IRaesYmmV+nVZ1
	3ja+Jh5Nbo36D09D/fHZ2XN1w66Un7liWFyq95iL+h7LcoDsolwfjsvhgQ7D4cfS
	aK6VqcvLEk7jkHcxLCfmRhU8LTHnot3vg1uXgeL3zpc0NivLqrXI8f73QLWG2sw8
	xT6PGbCJ4x4CgEjO0ikVzhy3FohBc73bl0NogIQTgJrpNy7nfVB7QFpsXtXIv3ZV
	9L+cUvjSMRzvR1RbmDvF4sD09aduZClRpci/pE84CF0KLuYzYj8GD3qYSiXcjeLn
	ySPyLhX72ralf5SsOIjVNdgkkEVneHZMBYwNW76JJI1Qxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrxn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:30:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso544633585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407405; x=1795012205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=X4AscMPxrdED3fsmj1XunppdOq1XIsB9mno9fLW0GY5i+Dr5HYodA5su1Yq7ETub2e
         S7ASDcQD8hwhZX9GsSu2yNAlzBU05RC7wBELly5GZ/NoH5LcSqxxmSU8VwEZMnKv2UIZ
         ZpIGQD+h+iNMof+vhgWq7pgIvo3Kmay1kKi47zUzhe4LCrTxGEoh73VFfVz3uXU22hxj
         QmoGr57dR0FrfldhNrY7xcHVvfVGZvdWGwj6HGGUvtKb1vCZDItEdCpe6K7A7QQdmpQ2
         8yKLVu8LyEIt5HNCRIGSazPFXaIj60JBGyYdrePNQIzyCv3hls97dl+JHcWYUH/Qb8UW
         K7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407405; x=1795012205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGEIt+0d09kkbPmVgRK9KARCj2NgxxPeIMDPZW+376o=;
        b=QYjA+5JFvb9zVtXUVwt2ir22EQtqG9VGyfAEJRTfxc1/0pwCSGTBK3+JnDty0oTC/I
         Zaer1KiHOGv8fjeBJlYuV2gn2Xbd+Z4xuLx26A4fcchAljv6ivDzTgyVqOOUouPibIBL
         G50Ps58aysIWbkna5rBLJGqq2ZyZ0UVz3kWQ6G9houGPvBP1P352nX8RNPfT8C7054xk
         UXNqNpLxPE/F+Hdh1SK83ohyRANu0eIMaPM61nF1UdyNufKLvuZMIi8hyuYxpMlgo41v
         4g/L/g1sWZK4hZzhTxKCrxmlV/15iE0J38K4wom/tGpg2P9netGtqfqE3jHdaQEkjNpj
         ZJzQ==
X-Forwarded-Encrypted: i=1; AL+hErHrSrgmiEdAT52igp6csaGqyQoH1+ELw+k9lztszQu6gpZy6Y6Oa0NJuo2xQgXteqrrZqvRmPshsyaoTNuf@vger.kernel.org
X-Gm-Message-State: APuU4Z8s9u5HjzgwgRlqR7uO7HzSrporNt/LAHE0UBcbJu4NkSnrnCtJ
	Z3nBl1YjH0GpwcxNcENiby0eKWVLfHwfbHAVrXKqW9lvC4c4brOTHYYy9cjdDYmKECmM+02tHss
	2nI5UItP9rHqxWtcwhUWeUzmNWjLyd630ejM0+bgf+3B3cyAVSt0JR06Lmy6RPglR8bsb
X-Gm-Gg: AYBFou2bRaEM5+/1X0uHLoZvkSkhSAROd3nyZAYxIsMzjm3dRrB8d4KZddEY6WSxi7V
	J2bSe+YylBFj/81rTFsgUL68xREW4i0I0d0QR2riP0dm98Gy30DhJe8B93ewItyByjIFu2KKYXs
	NX29doVaJn2EuuNMDk/irRxC55m1AaWE/f8NyW4329aXrPFywZylzaZreq+Jsqy4UTtnSHCEEwa
	vJG7f2z8xEamV2ETbU2xDuyGUSvfrUhE0MViYuXJFeAzccuPgywolX6d20YDc/DtoTcuwShi6rL
	prUPERfUCBmv7gI4BgabdUghSTARjHRUC2/uB7lUPlx19wJRJnrfPlDMrwszSbTv/jxGfpTcE75
	9pMExU+/ZmHZCAmFflkr+78zy2jk6K8RK7u0B3ud1qitV51JE4N2nU8W2plh/40CA
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387698385a.81.1794407404625;
        Wed, 11 Nov 2026 06:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93f:1823:308f with SMTP id af79cd13be357-947b00cd286mr387688385a.81.1794407403677;
        Wed, 11 Nov 2026 06:30:03 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3fd2sm12095367f8f.52.2026.11.11.06.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:30:02 -0800 (PST)
Date: Wed, 11 Nov 2026 16:30:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v2 2/3] clk: qcom: Add NSS clock controller driver for
 IPQ5210 SoC
Message-ID: <zx5rw567pockk65r2joresyzjvytukupcrshtovnnyovmrmhba@tbrrnvlrebn3>
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-qcom_ipq5210_nsscc-v2-2-7e2c1dda3ed2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX4ghyqpj0KW0U
 DcUoSjnY1V0KqP1mCBGTmhl1oTACR3u08M4iWFQG9Swtp1UUtHnHAJeg50gYRz+KT+N+qYkxk/s
 Bkn7hLnFxD1pMUUZ1ZzSzBuUKly6ggyTw9Dae9If9BSM8mgoHDnJRr/DPoGtKAkw4d656EL7bOj
 lKVEC1BhiUPiOMwcxf9XeZlys4dvJJ+HfkV9vVTYL22z4S25ArOzHL2NOH9aChEpuwlQ/AAOB9D
 GyRw0j5RURB1Io9YryWsVUV/C/TOYs/ixPFR/FdXFumrTU5uEOer25t+OqUC0BRXAroXhlOen3o
 +lI7g4KnbLS2dRmZq+5ioMEKqcj9+reMWKKHH8L4BHI9zTslU1/vJqO4JkTos4/BOoOsylUUOpH
 JbUDe5csgalc8sDq00s2ayzLL9jOOHD28Slo75IR4ym8jlnptYZ+/FWlawrJO0SWJqeNxpPxQo8
 vdxxlWqFj4TilhOWHfA==
X-Proofpoint-ORIG-GUID: SpAk0tEck7UxJAYRtenNEoErHjGq-8eV
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af47bed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XlM99vnl-FaGDs3XFu8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SpAk0tEck7UxJAYRtenNEoErHjGq-8eV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX34Fr/ajj6iia
 zFaihBOFI5rzMRXllMuVthB01DgBGKHs2sAPPDypf5x6zo59oTu8/L5x+QiGiGR5Yl1C2oVmE0N
 fBRKnKe3kDBi6HYdvpeKcPQXTNYd6XE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-11 02:00:56, Luo Jie wrote:
> The NSS (Network SubSystem) clock controller provides the clocks and resets
> to the networking blocks such as PPE (Packet Process Engine), UNIPHY (PCS)
> and the integrated Ethernet PHY on IPQ5210 devices.
> 
> The icc-clk framework is used to enable NoC related clocks to create paths
> so that the networking blocks such as PPE can connect to these NoCs.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
