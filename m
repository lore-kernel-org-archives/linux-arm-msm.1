Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7BD4FB9D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374942; cv=none; b=GqAWR3rQu8STtU4KhGpW12SZKWqC5w9h1+meAsFL+vAQVxi+pXzAmyBfKWisuU6pWIVGZWMoRiJsDW67Qvhl8a6K8iV+2EQ5e+EDjDjuPl8cP39uRNGYYYCCWUPNEF4DzSuUycQVG1YHV/OWYKHlcNiY6AQgBzi09sRmSCSydpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374942; c=relaxed/simple;
	bh=WDe8Nwp+8tXA6JvRXC4djLa/L7jH5WXFM1d8o/bcDuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jzTnAePOklpg65SPHt+wbvf7CSpo1/I5LwLyKR5nG1azchRnM+myQ1Un0FkHLxU7nlWt+xCRDyCSTnhAAokUUDV+RpEsVMmt1STmckgSwBcxO2Sh8BwspQPqtfOii24KRO2ihV+PkW5mRN9ekXv0MJMpY/uZzKrxuB7djAhRLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwUVcUn/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOTkkusI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwUVcUn/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOTkkusI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PInlri2889402
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 22:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=; b=nwUVcUn/sbesiu89
	0Im27RQQaQxZOJOZMyZhBMAlzBzDobwS2C6op74TgxAPFnj0beZHkqBa7c5CLnsS
	+Onoxmf9CEV3vB/unKZ1YOPE3UGaAQQU/n+S/XnZQKzMLu3prC7rS6/ezNBST70E
	lxl2cAsYAR5I4wGm+pGzk80ICPrSurQ+0Jp/sifqFF0tvKD0k0VwPb2X+2CBrIq7
	5fU+OdvOD5/6+FBxw6szO0tHDhKX6Z+Qe/TOce1QmxOqkzIL9Eo88G8qrh9Nq1Dl
	8/USu0aI7xJje5ILNbZETQU9yXNHd2S6krTrFoFibLz0iIe3VzodIXzYDnvPvoWo
	TouHlg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwwjc8y0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 22:22:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1437272611eso1677410c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790374939; x=1790979739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=LOTkkusIsE9Wap2MY5BQrUzlluLDrops8QAjch2lJNk0q4p+xXbVc/T/fYqK3DCvIT
         axWyIwOK8aPV4rqU9Jx0GgBLqTeoVYOZQ+jKRnTmJzekUU8Dq3W9QlbcA78pt4pURz35
         ZkXffhL2Eg67bu4WTambHRCcKe4MBieyLWRFQNwmHOd7j4oF0KvOL/UyB28vXQ7PkMBm
         m/xPDjXDeECxhgnWmlZD00koalDGEcp3RfD6jModXzrM/HO3h4T9wYep6Ogz3o8csz5X
         mpJn0kW7QPJjcbY/wcjP1r4OEa/gi85D1R0bGg/FQE3RujoNYIe/8aai0HNVcghEw3wS
         WflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374939; x=1790979739;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=rvQ9XZMsx1vfjQkKaB8pQO9wpnQpbYOA9IkLAwCMAhTpK4ZzYeIWwDvn3K/iPG1lxW
         i17ZLfYw8kI0dv4ztNXSY2Zv0KqGZXcMLX5OCpK4CI+EehOOGviQ3Yn6mnJ9QDkpjEka
         ob/3bJLnGHs+uqx+pFWTyuJ0SKa0wT9x9U4VIRzOtj46Gftde7l8EWRFfLvgQ+/u3GKw
         RfwFsOg4ka7EbvZ/grN43vP6RoSSpRQsLxiSEOtcFowl8AeyUI9BHqdofQLTI7ifWd8s
         vGVQovkF8V2YDJ1E/5glpjjhbmI7nPrijwILD4qZGpIKzYJy9tWoCvncstCg0nhcHzMx
         AfcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp2AcMQekO01ieoH2xdPAgjdhCZ4cXNs11/OzEfw+K+NFUePu+FqeXZ6p6KBQz5Q/h2XwTuBnhrN/FePJ8@vger.kernel.org
X-Gm-Message-State: AFuF++mlAc42hrE9LsbwwtJDsKG5DPhu91/ZHn7/66DmVVgcy7ralZJc
	MMQYK3Ncvrp0DqgBXXSd9OiCl/u/SzHH2KAUa8J6vSHNNU8k36wdv+GHmYd4Q2hL7geljCrEc72
	6/roXDzSXo+Uo67zBvi1lsrlotiVlohKud2tBzmAPu7GbvkuEt/yzHJ3xyXkE28gdP2U4
X-Gm-Gg: AYBFou0phH7GaRdXmr+pqL6FgPX7sz6IgNzKeZcp/vQOKCpPsKqs+W6A9slhPzaUwCB
	anVancZCsdDtFSLvumetLtKqkRGoT4Thq4XDgnOp9dlvFiiprv3TIhQVHoji+2haseLrVENmKwl
	S8+bIC045aCafG4A2Y/Hc9a6iSh13rtQwt0coGEFQJogctYtOPGzl7CGS7gPVa9Jvj1T+he61eW
	FwoXEdz9JLNeMByPWHZhYrOIt+caWqIIHQxOVQrceqjULpyFtqiWmwRtGHAsdMD2XDJRTB2j8LA
	2CODebZXIJ2dLKU9bnW+vqE0vF2Ho7oN0rO49V7EBM26NItIN7PD1y2RNFasbte3S1bAk1qPDMZ
	u7coN758FocTC+2aCs0V8GgKK+as76zWWIB1rLKz0IWzQiDsx871hbA==
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187788c88.26.1790374938488;
        Fri, 25 Sep 2026 15:22:18 -0700 (PDT)
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187736c88.26.1790374937815;
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-342c9c245a7sm1273621eec.11.2026.09.25.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM
 providers
Message-Id: <179037493652.3059844.6860403127536084948.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:22:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfX7VbjXpAPbFBd
 ya8U5RElNaJ++9pC+LOvbdSXb/vbLLgManPhtx4RF98/zfCLk33jPJRyTboXbJKWZ1dlAlYHopK
 FIIl8EDyrQryLyi+qeK/m2WRzkEF6Vg=
X-Authority-Analysis: v=2.4 cv=dZwVTnXe c=1 sm=1 tr=0 ts=6ab6f41b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3vxmhWUQDq8JHCpcIj4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfXwM15biBx4Xfd
 LYkact9xcqdLNnKbtyslQK1QEDFUakNKGYd6hTiGoTb9yuaMaFAhCpnOeDhy3b//WSIWRfK9WPq
 o+1g+qKna7z5qg7CD0NJc2ZNBYVyu2+HTzt8489yJyCBqN6xuQj6YjjXN8ISHEUPApZgoncZ05w
 R4KS+9MOS12oQW4favh7pX6oICQaJRcL7F7jtHU1hEgQSbBddohofJ8c+oZjS7jmjw1SnOLCePJ
 8oP8IuxWMFO8PIiOj26gzSy1ZC+ddqe9rVZ5waO1wDMPIaGtv/yY15WeQkJUhwLJvmZRqZ22MA/
 9Vogj3nI2q4DCf04hUtUz1zJahivjZsyN6ePMIDcLVK8XboOe8RCygrfhNWk5loU3ypopgcSFtP
 YsPoG52QN9ayblBs2//UDOkzUp7erDiBUiGWdxa/FiOJV6N+b4ohe5H5CcW8x+s6QntT7A6ZY/1
 7ejKhzywBZc0+i/u7Mw==
X-Proofpoint-GUID: jfi5_6eRlyrKPiTmwF8H_0x6J1nZ-i05
X-Proofpoint-ORIG-GUID: jfi5_6eRlyrKPiTmwF8H_0x6J1nZ-i05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250089


On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> On embedded devices, it is common for factory provisioning to store
> device-specific information, such as Ethernet or WiFi MAC addresses,
> in a dedicated area of an eMMC partition. This avoids the need for
> and additional EEPROM/OTP and leverages the persistence of eMMC.
> 
> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> Bluetooth Device address are stored in the eMMC Boot1 partition.
> 
> [...]

Applied, thanks!

[02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
        commit: 753baa59527f8e606c49eac25692b8b08918a3a9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

