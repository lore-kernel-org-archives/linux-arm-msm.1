Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451553;
	b=hg1HjpdfzIuwv5TIjwzUpLUmitYB1WAUBUuK7trlb9Cd6N7w9hhXyw2RTwtOHD9zR91q
	 +U5o4UQhtfIlaT+ftaCDYCt7l0AGn2hxvdkVlC2SsOYBULRAUvrVB1Ux1q9D8FJtFW6XW
	 Z7Ust242prH0oxO1KijB0FDx6mewMCnpk6XRHZS0+h6/Du+DfuEdcyAHXK2eCz0SBAX6G
	 /BwI3KrmkA/I1CBFR8vrPIHysmQwI2EK+vUBHOCgQFa31bMjtgv1RzYSf0cmGveLyd8cr
	 d/0hwSWubuSr5kQlf0FTEEVT+AgnJmXgzTCuCMLWdiuF1NUNDfXZId4Lw60rz5iwTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
	b=x0o0uADva9OIY/1fjoODYRvxgDQIRpGcg3qpmecm4Jr6mdtfYTTwU/MqNP1lzzQOdaVk
	 L+HizOoQhoFb+CWnnr3dXa5StIdDIU6GLF0Ybz9WRgV0Fk6td18UDFGwCzy6P4cCzt1xX
	 sou7O1Jha6CwcfMS2TyOA6p33u4cxEovjdkiw7lctM+jyGmQhxCn9LY/V1p02HJUmkI0G
	 w6xdbWFYy0rJmIU/Sn1fGrwYBLREzjiH67VNcy8dkNC35ANkLlqWx0wur9xELFdOAIoGp
	 r1FAasHBO4yDaNydTmVj8eEXkISnvnSqcDA4avWbIWXE1y4Z5dE58WyKM6MSC+VQaIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3HkjXy3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfpG2JD1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492AD606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3HkjXy3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfpG2JD1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGqCK846515
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0TGuUSV5XSvPI1Dd46vwu0Gs
	nPiDPUv/PqFpk/6rYNU=; b=D3HkjXy3W10L1qlo+hyEmhVwRgOk3zPtQqTzh9uE
	M1oy+ZWsMKYlZtTuKh90FT4wnPX70amVLGsqSYJSKCPLFrfNPYRGNwWSmxSfs88w
	AgsQhCOIQrO5uc7K7mvQknbPZ0dZPsD3OJ0tWxz33p3URmz/otBXB9emU/mvAoh4
	/KOpgbZMnt7ufWVbzqtTNGLl4BQgJ+0GB9Szas71vaRSKYcyanCUAAu8nrGuB3HZ
	kkG2tzf8KNNvri9WjJ6O4ySPA8gKdTJ6XqiaFRLt7W9dQLVPGaMIJIiI84lat9rh
	LKvkkhMSf9ivxuHo6VDeh54XnMTi/Z8ybZkgENOhHExwKw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742ch2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:32:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a7af8b94so1516755eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451551; x=1796056351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
        b=QfpG2JD1Ghkj6EsUNcejcnPofkG+n40449kVAJ62FaCprPU6l7+Zr3riy1z9Urh/if
         MtyqHdpswPUFdnxqN5FSkf1pHpVdS74UmnMjwPvKXtalDyY6HC+A1D/H6wQ2iACk9kaD
         Ri/ZsxOnjyQBs6/DW5A4hhhjVXGTqG4mQ52rqeUgSpvEAvzcdXd6eMTVG7gO3DNiPreT
         wmQ/iQAKH0s9uRAacpTYg2wvVjOCeX0rRGuFZW7Ax1BbsHbT4oygypmjNaAbcLP6pD/+
         6TxbvBKOWQnu4c4dXXsdDduDOPc96qU/N0y3r3P1IsRukSHLc5uRD1E3pD/nqlqCIiNF
         QZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451551; x=1796056351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
        b=APpg66qXZehudbMPu8KZe0ofcamsh52R+QzU4jHtis5zxmbgpjn20fIE8stxh0l9S+
         Q3ja7TPj7fb2U3G8w/CrI3T47aYplwhvThxUIrrxwNyOE0gVKxL4n5IKSLW8vTJ4FX+5
         I0WDTdXhDpMl5EmXDOl+WQFYk9ASlqXUar0E8fq1KKIvt2ZnNSmi+T0eO1VUIx6gQB4w
         qbtN7EZrFNnEAl4kiVLywwAZGKNhf/U5vjeffh7TdUadNo8Tnw1NBHgTtJvMupOkFdjI
         Mr213lyMlHeCT3gxlubGryelZIXTKEchDRzUPu1CHi60dghk1yaLWPFP5VzNnhAryGSX
         WTxA==
X-Forwarded-Encrypted: i=1; AL+hErFfDGiGhCO5gyVkMbGfZjytOaP4uyniYel7RQiD5KvvgLmxX1VdtQmKpR/vpoETivk8HvI9IM3cR7Ct2xkC@vger.kernel.org
X-Gm-Message-State: APuU4Z/rL2F9C3pLA8UqkGcFC8c4NNBkyt08g0dRugUshNiVgBhKat5n
	SwG7ay4wW0JedB3Z14NBxsLWpFVQm0xBYUDiBUH9aUlLeCN9scGfe9rAOrMl96AJVanFrrj/O2Z
	lQ4liv2OSI9rLtgoAqOoFNpqDjrn/pxMo9KZHmCbBjs7fomfRKf2U4mekUCJVCZpWaEct
X-Gm-Gg: AZFdTZfGnohdJmrQ5jdXT7pwX7qZLalKnvekmAXvvI+dUJk7MQ1jZ2MBGT96+i94QUG
	BnVAqjbGb9QBytUdIcUyFdNv5APcNx3tW4TIXGcWFulEWyqCRAhLZEmMfw3imMWWSVbOetWIqIx
	dgWzbMoZyXGlbWTOGs7xJQT1SfXSv9poMtWUmJy6+eKleI5kIVzj9apsG6cv1S5xLA3Sku88pnw
	6/fr1+sFXMaiw6RjMGYQFwkrMar43NWe2VTRT4LuJm9vOndBuLFpe7p1zG6HDnz7lNUtMgjFk0x
	5pMa+W57yQbx2aKcSV/rZI7FfeUc+PPas5FkXzy1LwS2bKsRZHCpvquuKwjeeyZX+j8XU3hlyVO
	jgg6OOsppCl/ZBRD1O9G0w4qRJpJj+1E1sWdmb+wnzVNqVjLo6Pxjl/hhVxb6QViV8ybdDBUswQ
	GO
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12572068eec.36.1795451551200;
        Mon, 23 Nov 2026 08:32:31 -0800 (PST)
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12572034eec.36.1795451550583;
        Mon, 23 Nov 2026 08:32:30 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm3867956eec.9.2026.11.23.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:32:30 -0800 (PST)
Date: Mon, 23 Nov 2026 22:02:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163221.sau7phw43zc2mo7q@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
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
In-Reply-To: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-GUID: F3gItIs05ocGPCBYxnD8LN2Wv653DLbA
X-Proofpoint-ORIG-GUID: F3gItIs05ocGPCBYxnD8LN2Wv653DLbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXzlKPlTK2o6wL
 aAqkBJ8+AdJUaupCCCQvkVjV6jYkBzhYzCPIEB5SFIsI569CGYDogNLfGou7H8t8Y/wV4gey5SG
 QQZrkHxIng0jJE/p3Kq+0vVM4kKgA5Y=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b046aa0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wLgbqfl3iQV84jYfjRYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX3PPJXXjBo5xx
 QNtiMX2XXae0N/jj+2oevVAxbObQsP3+7N3PyC/O+EGiv+TcZf8gHOg4h8zoVc0nPUGGVnZc1Or
 5omTqVnl768IugVAPmiLgRNxuSovjVsG0rrtVMFnXAXe78VFz8JBKJJ/M88U5jM5k2hBr1jf6rM
 tMLoVLx+5CfS51FcGKQUy5Fg9Wq8gBaawXFIVzLVVf4mlBeKw8rmfukUyb1bS394qt3zmLYWXHd
 Dh6giRKwFNyknKF2LxXaZ9c+rAWhmJSFlEFTHhuVwEZ4fDGLkKa1E+2LIr1fYb+fslLISCEn0Hb
 4lDBhI1PXY+ZnvBvLJVstAIA3GljkzvrLPmeUPqgTvcIR8SNECixuKSYZHSC8yaBwxXPmUL7AYO
 Z0eZqK1N3yxGw/Y5HaON91O5q7sGfwPCBnpJPxjEaux/8n/xWY/pGfKD6rXll8aAz4Z3CFIv/Dd
 g6dvO6d3tls37tCIhAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:58AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
 
-- 
-Mukesh Ojha
