Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7639F18A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328192; cv=none; b=DqXosrCd6LNVrvwS8g35ZhU8R+Q6mAhc0ojfHtWGKdGvNYgD/Qv/hnDqrQ+w8412ybJYDclKkGXn/gvEc9EJ+FT7ebicFFZW2uBvpn42abXu7WaZ9+Jtscblux6ALorh9Dz/ht42PyKglVG52dX6qmnXIKcCPpVwI5ODIRFTH9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328192; c=relaxed/simple;
	bh=eU3rIagD/DJkspdzzDXpQLbCoAx9UdH+KUAOnRqLvQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDA+U3QtBYWIw3gOYW69Z/c6b3aXRh+3S4TSnosqqUL4WSURUHDfVti5SBK5tuZEy96W9oSGKxaGT/q/k2Dw7ciRL9q84onJBQVyMEXT4ByLQGxyHQx674deBNaBhL8YO20kecekEwNMBTAbHQrobnNXkZyW2XSKWHT72N/klxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5zwqaXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6L7Xv8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5zwqaXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6L7Xv8F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBlro51512062
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xP3ywTkDvhhxUcM07PGoh5VmOojNwTFiUi/voo4w34o=; b=R5zwqaXsVQskLj4h
	cPx8jKeFWgDQkG8+6lQkJbuYaN7v5nkUmN+stni7jjCyKbve85qqHhfgwlUdW4Hx
	Hr3owy5LP8SfPElGTtoT3VLrBhDNrHIrgX1iWtzXwIZlvHj8GSNKWKjpSDc89q+5
	Huak3p5J8nZV8s6+1raiWwHphhhYxHv3mCSW7dnkreOODRqYTPv/fSJz/j9c7ycb
	WTUTKGyTErt1OsfESHkGtFS0nk76YJU5aOn4Uuf+3DBht2txoanqqUXlO5VXrnn4
	ssQqVD2TQuJp6jkMQOa0hqgK5Ecujighw2NljBSoAh0e9GTI36Dwzkbw7JUrALLX
	6VdfvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy904ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:29:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so1600661cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328184; x=1785932984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xP3ywTkDvhhxUcM07PGoh5VmOojNwTFiUi/voo4w34o=;
        b=J6L7Xv8FhJcRSiX53bMItinX8Bly89dQRmGB+IBpDhhweEVLD1q9XYQxGvWJRAIR1A
         swI4+sReL8IdTHHZboriTRQtUCJOW0O48r1ivAF9XO2+S1F5TKGz0Ia1QYA0wyfTkvLb
         0pivbzTk9dcrjrpJiVVQ8MVdNJO5AJWXqaUL9mRTVpZ6eIN5SBX5He8PP2svkC6YGrjK
         oFok9Gbszh3DdMD6DpAojRxfPw0lENzxLk3i7+ZXeulViXS72gQ89kQC+a+jnSQTyNeg
         4RR9LscCRPpUUgtB3kK/0Fma4ORyLMqNDHey3sq5dJf/t7hj3VbYbcyCTotUAWPv3Szd
         iEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328184; x=1785932984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xP3ywTkDvhhxUcM07PGoh5VmOojNwTFiUi/voo4w34o=;
        b=YrIsVtS+W68/KXH+AuRpvgCAi4++e5QklOqC0tybxUeUX6QciUm5ES7+S9t5hq+t3t
         h4gRajLEObUSGww7GB61v1uJfAxQWirKaTKivHx0pfd2JSjm1emdnTVjIRG9aabV1leN
         5DP7OXQ6QU0v4+UaJr7aTn/GCoMV9yRRxzGIZG6b70WCToJwVUlzOY6hjdAznUJenei5
         Kub1m3YRAutO5Cl6TN70K1Jyp9jPaZJWirhaYhkMhYyAnUZjzcBbsNcjZFZyXgooQM3/
         26D0dVNcv60nNKM277IH1Xesri9YCF+lzG30+cXlTUM6CzNlysK/aPXnQRaETTGybgPT
         vAXw==
X-Forwarded-Encrypted: i=1; AHgh+RpaL6dMLJml+m1NaCoFMjUjAbYJ1KF2905uhy1wgLbM6U2qtCAq+tciXRtaqESokqA8W63ZpBUTP2RpOVx3@vger.kernel.org
X-Gm-Message-State: AOJu0YzJiLV08qa+yhQJM356M9UegaPPPTocUAo+s/T/1sWhbgq30pfa
	tyw5IHJy6EvtbaxGtEBytLqtaeGoa1QcriZpNSQb6F1bw98g0oTztbchpu6mvDx7ZBAI7weVfGJ
	wKkKdit0QOnMemV5rIWkOedgNgdFyV9ksar7QcV5ZqGyi9hng3HEtPcMHatvQGh0iCKgW
X-Gm-Gg: AR+sD12SsaRmHPbrEXlOdeMmv5S1yGTtlWCxxPGeijBFPGSuC4p9DTVTj83KIxBrmvs
	y6bpmL3dpHm/d8NnmPr6xoDBbRNQPAcKgKLWAUIAcmI2WPnXHQcPBWVOEpyIfqbxzSuPl4shx3d
	MI/Hg/b9VzxK7cISb96fJrycRNvppRkyKeCGHkMrn9hKx9x/qEfpbkQo2FIs0TAhEusl/oQVM1h
	oLjra6tOJXeLv8DRRkzJpl6Qon/8kkzdr9KLtbVu0Pxb7w2mjWNAlKxuykIvgIM+VEBNzSNGpcj
	Q2FZv/ncxvLMEIFVpVem7yF0CHd+6iKKu3FibsxSwz+OH6BupXfgiNCHVALt4Z9JYtLSy1s5aX+
	3Ll9LXd0q7zm/T/EKYdPbsb0q
X-Received: by 2002:a05:620a:469e:b0:92e:5ef1:9072 with SMTP id af79cd13be357-93302679f1amr590483785a.2.1785328184521;
        Wed, 29 Jul 2026 05:29:44 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:92e:5ef1:9072 with SMTP id af79cd13be357-93302679f1amr590478085a.2.1785328183945;
        Wed, 29 Jul 2026 05:29:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f8f981705sm53805166b.9.2026.07.29.05.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:29:43 -0700 (PDT)
Message-ID: <95c33eec-8eec-4d01-b0f0-1ae33ebb0bd9@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:29:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
To: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-5-2d100f30e202@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-5-2d100f30e202@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMyBTYWx0ZWRfX4i6Etimd+RSy
 TfszXU/3h0fJbuilo0ex1WsmCV4xHV+w6rUeGKFt9yP5qB9Ee/OVRnLIxRPFaqQFGw78pZPP4k3
 mNkhpErhO4zh+3vdIFr4hp0VOai9Smg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMyBTYWx0ZWRfXwFQ9Mq4xgVbK
 G5PNGWMygYhAsFwqLe5HvBoNS4qrF2ZlrEZEIavmoMl3d9AyIarpRaHF3m8hyYZgghV6kdTG6Gh
 LbvFKG7/Whe/CBkhXrQJtE2zqghCXAZdhG3tjQbIUb242A808Zre0EIFIY88tpDXi1JApeRm6XQ
 tdg2PkCpfeqpU1nKr5rQFiNNpCbvGmQnaweGzX89IHqdbnwWCparPazZLLO6ZRNObZMBVVm/eDP
 6cqy1l5rxVP6Il67ENAR+6dnpOV5R7CPpA534+4Z4c2CWgGenNpwGUiNzZNwPq6owo/lc6LtQ8r
 GaCh7zTvgOsaP6PtFwUjPWfsi8wE7Xf3OThH3U5UPOkgUMs8JFZhacTFQKDPa9i2/MDg7Y2LWxE
 Bw9GvzfvJ1fLtu1zrlqCJHiZxtV7NOo2LZgsZO75SiHd4UeNAZMbXaoNqs3O64reRwdd0GskzD0
 DUEMd6xeP4daC8VeZoQ==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a69f239 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fipHztts28RoyCzfkYEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QlmBoKFUlMmgW7Y4Vyyu-AGcVH61yD11
X-Proofpoint-ORIG-GUID: QlmBoKFUlMmgW7Y4Vyyu-AGcVH61yD11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290103

On 7/27/26 5:45 PM, Rahul Samana wrote:
> The PCI core needs to associate the DT node below the QCS6490 PCIe host
> bridge with the enumerated PCI-to-PCI bridge device before child nodes can
> be matched against the PCI topology.
> 
> Add compatible = "pciclass,0604" to pcie0_port so child nodes below the
> bridge can be matched by the PCI device class.
> 
> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
