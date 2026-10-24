Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873821;
	b=5eKOBh1cxQCzTURwMdh81jHv4zAqqu7V8F8J7rO7f8HOhZO4KE6f/0jwp2Kcet2gkzHi
	 70ICjrgC1LnVtNVfmc8oqpR2dOZkk06R4p3pWqqYEM6kKk0najbTjBuIZ8rrg5KyJzstW
	 uZB7fOC2Dtg7RI1ZFL1oMSatzpnmHRBOKYluVADiZJ+Gr89GDU4uzfyhykMl/Q7XFyxC2
	 ODDeiAc2oV7Kb7p5zNeZgUXco9jvYjPfPjoFtU2QCbH8UcdsU/YvBuWAKt52MtvuSyjEd
	 77nIvG2SqMiw0odi6zVsxK1ekN9sjeMCW0Ys8XyDbvbig5f/kRIxKj+1dxMybh3h92Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
	b=EHmm1Tb7cP6jOf0PJqWt2Xn9OoGc0+z1YPoFV3WnCa2P4BvhAvhHvnaC988wKwxQ3uHx
	 JsvxoNSSRMlav4kPjjgF2dgrTD07LzfUDvEMJPUdd+xqulHEIvhYPKRljKK1rtGdEfs0s
	 mwLzEXLCu0AHLFbtP2a5R22/nI5Elku+G/FL/hNcrjP+RI9xwXkMwyMAVQ92y5CWjK5h0
	 emX+aCVUl7e8H0x/42+7IhOX6IR5NFfWebrW8PXkY/OIUOoTKKN7ceg/zxHPrvtsqXQqJ
	 YN7fh/s8mj0p0280OEzkjBx8g6kwFnx0lm4k1T5J7xKaxZYQhruVMLhkqRpHzhvm9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LM7su+fd;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGRvwvn1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB7606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FB7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LM7su+fd;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGRvwvn1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU6hV1987529
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KeiwgXi1K9u8VMrXK+4xDuwP
	m9KyRDE8crSBulhqGvY=; b=LM7su+fdDMxjVmM4ceqqXJs/RRlJVqAelDJuAUCJ
	VrNAlFqMBnhIct7u++9kYqh6RQHpbbRFSijeXjOYSnbP6kQJbLdSGUdgzD4QKHcX
	BL693X/iNRuzIp3rwU97R3LmTE9tENfArSGRQID0Ih0harZRgAv/94KngIwmxW+X
	JxtxN5X+NYTGSsTHWDxylEbyfLf4xz0gYgrJOvG/EzNa2ZN9EUXq1RgYAH1n3cVf
	H8WcJ/uaeMxSy3Q+D8uYkQ9iSZbwWhc2a4ZlqGxWlFy+9w2eSTsD36ruLmAvwEox
	Pg8ndN4aaoIjchSoBz84JPBw4NcLqSPsXQw+WEJ6/6LEBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0ghump-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:30:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso311452885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873814; x=1793478614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
        b=CGRvwvn1FzpW6ZEW+fWe3NNDpRWwjX2Ifwwd6g9t7JPOPJ2hm1+VKrFZ98z4tN1Eyd
         cxt9AwRvhpqGJpHNWHZykNVoT5fvpU1dwlOgLhQj/wl7ZLJrFSRs6nQTraIEj8P+GrsC
         Ve1WqePz7i22KipFsbWFe9GIoOWiiSNovK0xJwqteTvT7DTt+VdoxEA1TNuOjcG+CYK2
         cpWvKEoQgwexd6DWiRp0ojNsoPJSVs7IGhKUJob2RK0h167Wxv1cJEX2gRB2wFl/oFQs
         yfoeObHupaUG73U+XFl6PT9JeDfe+eKAgoDKkeJU6Wj+jQ4RGaPDq274n0u4CIJC3IzN
         N/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873814; x=1793478614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeiwgXi1K9u8VMrXK+4xDuwPm9KyRDE8crSBulhqGvY=;
        b=QEFi9yU2i2ISBd1UQgayGQxvUPunTDQHARfNX8QRgW8iZ7QEXjsJ5STkFoqWKOsuJR
         8mp17sWgyIdNKRzQB3pLT/14NBmd9iuyOfoHDdkAIk6cJgl4Ay1LJqqgjBCfW0TvJiVS
         2MhAIF4HLh9G+S3H/d/9YsTVVBBhP90fqxa+vZfGtM6MxKHu65N3tAWWRYKH1xLf8Att
         3S0yYk0mwXDfnaU9hqB8hKhEEcPFwy24JFdnfwBNyIZzxDxOomztEFlmODGRI88Jj0vu
         XA5mHi2lGkz72t6pIa6MUuQsJcU7YWe2G9GeLnonyCmgg9bwMIQ96fVm9WwD0f/86yRj
         vLbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzshTfFdihFMkglcmzIifnU2fs3gwqjDvwk/iodV0xtLEPdJ8IhCwdGVAvnrLjUXYivbqw3C17qnqlpK9HA@vger.kernel.org
X-Gm-Message-State: AFq9FYJlwlni7aqHJSQnf/1HGDMPIA+0D/YUze/rDYxElJG4tSo+p50a
	qA0fB3brcmPigmvKGUIi1DX5ofcR1Uvd+13YoZshsd2evE7dSwprRABISbeeLTqopLPUODWLGqJ
	6KpgqX2CZe+zJmW11BI76qnBqgpBTqMq2sDfjrHhbNt1lxq944KioarScs1l9TRRxQ8V/+MXb13
	kS
X-Gm-Gg: AYBFou3Z5r96fZFFMxKEIcJskop/woGf8/mAlaBwTAkvCypo2GvTJrAJgb38/oPfDbE
	rjKbf/lSXYr1P6vuLNlOL1YIMfswK1Qd2irziSolH650Tn9LHmeCghMI0smEBeg1WB1IEwLXYk5
	uuiwbbVRCj/7eMhXGmcV/pl5uv6WMRK/Mg+A8+FUwwMIp5PqTX0HM74hCTUjvjA6AI77elH8DEk
	zUcwv7uOKIkLsEKzcmgyH1uCSuwAnDOBHX6EyTWic2Ze9D4hQaXm4v+tYL2+lUpnTZYI0ewNHt/
	f3BlDq+nvDzOHecKP8XMaqk14Mxb3f4x2CXZkSRN/u9MTymzqNkkZgM6+Zml/mb/yAT+O3wpp+B
	rkMjAPOhapF72Sonp
X-Received: by 2002:a05:620a:4413:b0:93f:3cb0:464b with SMTP id af79cd13be357-940ef980d30mr409042685a.49.1792873814334;
        Sat, 24 Oct 2026 13:30:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:93f:3cb0:464b with SMTP id af79cd13be357-940ef980d30mr409038385a.49.1792873813758;
        Sat, 24 Oct 2026 13:30:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm6746311f8f.48.2026.10.24.13.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:30:13 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:30:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
Message-ID: <k4ogudreh2a7ug3mtovxqyelip3kog2bz5vswtjryba6hk7vx7@oervurjnf22q>
References: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
 <20261022-gts9wifi-dts-v4-2-a361428fe59c@dxdmail.cc>
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
In-Reply-To: <20261022-gts9wifi-dts-v4-2-a361428fe59c@dxdmail.cc>
X-Proofpoint-ORIG-GUID: 8gNVrheDUDyhR_e4YD4IOklUli8bM5_I
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6add1557 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=AqZmfHzJsoaMp3Ki:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zDk8rvenn9N7faQbNqAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 8gNVrheDUDyhR_e4YD4IOklUli8bM5_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX1tOl1KsgJ6Fe
 EfDFdzGxCiZ+87mRIQDDK5YA2Hwb4pHWn+e1Fipm7qhPBh1F6wQpThsCNPKc4G1Vs73FuDZzuPN
 UrsW6Jw4Caub8uu8cqPTjzbQgjnfRK0dHd7ROeGashDYtIb2EVZmi3IWuxIY7I8cSFjl5s7q/19
 cw4iVAM0ERLfWjMIk90UE2WNxe1DNNntTtwJ5D7ufcA5fdoa7n6du5ZDyu5/NPpvhp3bv8O2nJg
 Ymv+98nwCwKWzKYHDdHJCA/wu65irzyvdTTJCmBPf8sa4yNG9BCEdEp77Zpg93JX7Ummx9HIQ5R
 w0iQXN6+tBAUSIe+lbzaarupzqTLeE1nDx9qs8Xv8lwc10bobqQea/Li5UZeAMin/QFG5PyweBa
 ywDljMX0s8PU4UWEJuHiN291nwcEk8BYpWdm+cE+rwQjQHhuA7TFD4qCOwpCLZdSYG2bvCsLox6
 PyXzd94of6Uqrb6OEAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX4BltTdHl/MDp
 k6TUS3V1M4b14CnW0yYRxcqxif2UM6AEi+BVbtQeRF0vxnELOCNFyXKMlk2T/TIN9ZyzvS+7EIF
 fRGyVYN+nlqNsze2rqeoUqTWrM4TKQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 23:58:20, Nizat Mikayilli wrote:
> Add support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710, codename
> gts9wifi) tablet, based on the SM8550 SoC. This is the Wi-Fi SKU, but
> it still ships modem firmware, so the modem carveouts are kept. The
> modem itself is left disabled for now, so rmtfs_mem is dropped.
> 
> Described hardware: UFS storage, the microSD slot, USB 2.0 peripheral
> mode over the eUSB2 PHY with an NXP PTN3222 repeater, the
> bootloader-provided framebuffer console, power and volume keys, the
> book-cover switch, GPU, video decoder, ADSP with the internal audio path
> (four CS35L45 speaker amplifiers and the VA-macro digital microphones),
> and the WCN6855 with Wi-Fi on PCIe and Bluetooth on UART.
> 
> Tested on hardware: booted via U-Boot on top of linux-next
> next-20261002, with the default kernel command line (no
> clk_ignore_unused, pd_ignore_unused or regulator_ignore_unused).
> Verified: UFS storage enumeration, USB 2.0 gadget, framebuffer console,
> power and volume keys, the book-cover switch, CPU frequency scaling, GPU
> (firmware loads, render node present), video decoder (device opens),
> microSD (UHS-I SDR104, read/write and card detect), speaker playback and
> DMIC capture, Wi-Fi (ath11k probes and scans) and Bluetooth (firmware
> loads).
> 
> The display panel, touch, pen digitizer, cameras and battery/charging
> are not described here.
> 
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
