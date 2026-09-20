Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5613DFC86
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890907; cv=none; b=ZEAo7Dxpf18PWySVmjhFNhD3mW+NP2qJUDfZFyOJ8LAkCPGydkA6z70OVMLOpjoMgiivNtXVgkNNfXSnz6cPXIZKNYA6/0QZY1/XAhu9CSHFv8RdkBi/WMYzq/lKzMDAipz7utpUfK2T/XHYh7xqG5BvHGEZvt39pLfn3Bfh1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890907; c=relaxed/simple;
	bh=6aMwnDLODsh83cPCbbnt4oDou50vnwnLF5ymrWCvs9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=On27RmaQYixQjBVjVU9CVujRxbde08nHuHfL1gITPga+2ysIvk8V5Q3DVPHOQzc8doGBEcrdDUhEWw9wm+crQobTdwpa1lIvRg0Ng2k+06b3ygtebkyDbVbYiwosrEvHuEhn5dRlM9xEe0XwCq5FdTmi7gc3ODcaMcjr4YrRVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9mKPkZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEGxKn6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9mKPkZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEGxKn6R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55o1f1757199
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=; b=V9mKPkZmvG9/i3vr
	926vOaJHcCno21Mf15/CDocoQTFMArdwZ53MKOdd75YRWJIy2A77d0pBLiCxyQvj
	9lRqEI5PX6+eSobdclwfK92eLK+/zL6L+bLVAWhpJ1PebZJxQlHy0ESbL4Azqeij
	G+axa8WhZb+g0wwBxUqJaVTQCUy8F6+N/E5Sq46GlXEtRng1o5ISFZ+Q8clcSqFi
	2/XrsV+e6ZhJGGzkomROJiIe2j2Os0dDytB0VsUvfw9O5+6IvweMO/Gms/oI/k1R
	RmDDqyddivelCy0qA1atrgzu6bg6riA85QU7XRDuTlj413JfyO2hMaNngKHiQlUs
	v5lCnA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfujh43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:55:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd753a52bbso39739695ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789890904; x=1790495704; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=;
        b=XEGxKn6RQaE3J0dPvklvhQ5u5HfPqyXF2I5lTWcvI9dtq1K1mkgyWrbFA5SCSpyWJE
         dX423MnMgXkcG2FBtXrR3dMhZGLaXsGoW/nUMD9SEGKOmPRxrY+x1uCPYbW0h/ZPsXPi
         u8N7IpI1SS6ZaKJlfqmcSKXZgsKf3g0ckMMicF80frMhZ72VqhLcx/vCdXurb2gAhYdG
         s9tGGbdwrmrz1CRRPmk9xN9VgZ0KrZBOb394XSsOx9Eai4UPpwvPyVqSo0EY5ym3+gJX
         fMoK7962DPi49k188bnauEXnFm8Hu9QTKX0bASl7TQ0HvhQ0+fBAfvSHFOpTnKTvqm7/
         xY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789890904; x=1790495704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=;
        b=n7uEtgh5bcWtJU2DEja1rbqngLE1nGueINmBNCxxqXMOfX17ym43NkDZzg7ghbtVdy
         CREan98mV9ag0vsjeNLiNifLHHD4q4XJHACAlQ+YOc3Y8TCVgHcLA3WFd0iSeN3cqA0c
         UnX70WUBRsYyesVCRugGn230mLdHUBuyAewKkC3yJiq6NV2tAPLIkHgfIjRRCImHxrYt
         WHPBaXuKc3BVFYCblp4Tga89gY/YNdHX7Q4BxbjHnORlp0iGj9jkm+DoUF47wNkFPX2s
         NqoDfGEZOwN0PCa9kdTkipWfN7ksL6xm/UjF7Dz1PVAwYqw7W9GnSwQw1D2JWnafN4dN
         /tww==
X-Forwarded-Encrypted: i=1; AKwUvBz+axCjO6QpASZqgDAnuChZPhRg2BKpTOmnHrz60p8MG41GwpiNyZwJmqN7RiGUWDvlcrNlqGqm2E1GmBHi@vger.kernel.org
X-Gm-Message-State: AFuF++mQnQxiRqCz4WKiQZWloAZ2AZZrr2wchNepR7NgrQq9gbUWxSqs
	zMGZ2jJeMDBvL0m1T7Jva9dzZJPyYlXBlxwzWhLs5A4HhMefvWRpOP5ecFJ+j5IBZ90x04F/XZk
	sShA3GbIvygtHQNClqR9C9OoMExDCdN+sX6M65E+moxLUMwdxpdfr9Y7n9oF4tMGKU+Ioadv5+e
	86
X-Gm-Gg: AYBFou26GOEK/KvKCgSr85bgVtzFMvD1sn9fuHmHo+h8xRJyn/H/c121/LzzYS9y5/a
	AQsB56/G5WS8vXyQajJjodowMd7CajBwBK53LF/UvlcTye0FabK8KlHo9azA7bpt/NL1g8i6jSs
	89P791SsmXIO5ZBxhNmidgkUdjW+4+7b2iOPc0YhUbUDXGkyA7d+TnOfCSUWJ6HDuLNtQ+CgM5c
	0cVF47VHTpqLImMdKsh87o6C6yTv5zPZzc/3zWlNHcFN6YIDKe3+p3p6kqxi32BrLrNvu8QMJMZ
	RtayVpbGeqjzT6U27EEErqkGnbtyxuxEg0W8UvAjhZULqmywso4IDZbNWdl7OEZaEPZCT8LCWxy
	A6CizGWqW1ztq51a+nQrLSF1+dyU=
X-Received: by 2002:a17:902:ab8f:b0:2dd:c100:a5ea with SMTP id d9443c01a7336-2ddc100a6aemr43931215ad.62.1789890904376;
        Sun, 20 Sep 2026 00:55:04 -0700 (PDT)
X-Received: by 2002:a17:902:ab8f:b0:2dd:c100:a5ea with SMTP id d9443c01a7336-2ddc100a6aemr43931085ad.62.1789890903897;
        Sun, 20 Sep 2026 00:55:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331b0d6esm9198574eec.27.2026.09.20.00.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:55:03 -0700 (PDT)
Date: Sun, 20 Sep 2026 13:24:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2:
 Keep wlan_ce_mem and drop redundant wifi memory-region
Message-ID: <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
 <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
 <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX5V3CyRmptlYa
 DXNAdua6i6S/hIx95FhHmV1L5fcUoA5xFdujfASQJ8mvQDuJ1LrFO2/fHB04Mwbb4MeTPKV/EaQ
 LXiB1lJd7lcLMFxFc+SKJdLDFS/ODtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX+bh+knvs+6KN
 Dx88rpRI/RW+QocbCiKYcKDSiAYW2rrHCHJi77y00FaK5J71nF5r+iYzFOE9KyUhupL1n3VTDwE
 NeKllEi1Wa8UV2GVIgNfNssDAgtdwA7Ig3Dew5Q2640CI2wk7g3FlNv7w6F7/Lz8W+SYX54YVxp
 +lxpPodsGB/QE9/Yf8UBD2ZR0fUX49HGpXh71WQvWjuFSlhERmdNOs3n105LA7RzFC5vBemE55z
 7xgNCovtXLYYMmSgyMOFuqBfVp9hI+274pSWKxA54IcOiSUGyys6KjaLxSiRyihzB4tO7VUAZyk
 Or/4Ar2FF2pIB9n9aRyaDjVkcr4t2S/8Yu1+xodG6BsjkGQA97w11UDQe0yDQb+VPs3OMdJSjXX
 sVOyw4DZoyGUT+mzEmZ2FmGWn8VhJax+u940ClRKb4SsKKeZVgJClDRGUGpbyxIFH7LYJbJxHMG
 1LDpBWM7nXBZUaHqTAw==
X-Proofpoint-ORIG-GUID: GRZDd2AhwM-zGxDTwhTgzcp7m6At2TZX
X-Proofpoint-GUID: GRZDd2AhwM-zGxDTwhTgzcp7m6At2TZX
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaf9159 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=WbCkzZcx2JvGogR84Y4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200113

On Tue, Aug 25, 2026 at 11:32:49AM +0200, Konrad Dybcio wrote:
> On 8/3/26 2:10 PM, Mukesh Ojha wrote:
> > The reserved region wlan_ce_mem is device memory used by the WCN6750
> > firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
> > erroneous — the region must remain present regardless of whether the
> > underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
> > both board files.
> 
> But it starts below 0x8000_0000 where RAM starts, so it shouldn't really
> matter, no?

This region is used by the WLAN driver when Linux is at EL2, and similar to
Kodiak Chrome, Kodiak IOT also needs to use it.

-- 
-Mukesh Ojha
