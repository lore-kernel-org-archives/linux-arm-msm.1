Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0737F00D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912210; cv=none; b=HGENOZ2vRXdxtQJW81AZteLr0MibqaqUtqQ7Pf9PRpCgJyzWUnTNIm3MdATClW1mRj6dGZhvgl800wVm/3eBkkMc1GTKlhRA/KeHXCRyesBlYi5cDz7SUS5MDXq5DedZTKrSzKmOJ/eHEW5tqCmm8oV1KGJ0q02qiod4wRQ9aXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912210; c=relaxed/simple;
	bh=Pr7XYcNsNx6NFmmYHRdEJqPnkQiZwTd9ZLn4JbDmhF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLtjFf22QkrrXep9ndj3B66b2Ajg2kGjNfbALcmAa3nKDUx/rxBulUdHWT9iqtZO2IftPa4XlsWPEPDkI5Dcp3r3v02rpL0kZbWVaPGq6hVwUbSAB5dd5oth7rhLjmyWA90dDTErX3LiIBNIRTmGyruq4HFLmlu8GLEkmqB++/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+3efcbD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgH/ryHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+3efcbD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgH/ryHi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7lfW1581409
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MJzRQ+TxZwJZtx4rj95o7W3G
	i/oMwqlmwnUjZaaQxXY=; b=L+3efcbDL5b09VaXC/AHU4Kvz9PguOI8/4zKP/YZ
	vRrhfUrJPRX6+oddid/PV+N6D8bgTucXGOn77Gsnt+XM5HCMD4RmLqao6EZQsH58
	WuSvvYIR/0Zw/jOWnTfZSxxhbvwIowbWQoi6LgWGUZYMUVz38xFho/D4ZHntISF/
	Eqvg0nFZFSOfSuy/aO2om1j4m3+jpZn8iAO4nWwU/ukwlhVZngH9FBrJThUp6yVz
	9Jys4UzW2vFdqlnzMMfemNcfnywHfQteYyBab4ZNDapwjO7+QNHCG4heIqtUL5lv
	PnvmXBs60yRZJuP/b864lBD3bJXF8Xy0snpZN9vJynXqGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc3daf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:16:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93915f50a5cso115021685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912208; x=1788517008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MJzRQ+TxZwJZtx4rj95o7W3Gi/oMwqlmwnUjZaaQxXY=;
        b=EgH/ryHi+xcvY8sClsrccEEZIVm1vHAg25Dt/ujjXhqcRWAc4n4dkNzsNbMnwKVXd4
         MyN3nSIQ5uRsGRxHU703Vu6E5kgHQVhaBNg/l7Ll2yGD2IgaZIxb0lxe+j2rPa10d5BT
         7oMj1h07zjE16Df3c6HclynobtyK7pLpH4rvtKw7n3cys4OMbNl0hOwLCLtjNFs0f8WV
         tyY8DqxKUXVoE2ePQLgqXp/EY6flVlUgzxfoaFQrELI9Zb3GuOtLtyAR4wpcYnESdyiF
         Tq/f0fqYzWUGjGbM01ipRLi0RWkg9irOe8vR1/PswVvu+yN8Z1l807fTU3qgmqVy6p2P
         Zb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912208; x=1788517008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJzRQ+TxZwJZtx4rj95o7W3Gi/oMwqlmwnUjZaaQxXY=;
        b=a//eOIofBBgH7paSnbCGA13fgGdGh9IvaQmdMZ1kAbJv/p1QJjmccepO6V7j4l1bGa
         /uSNSOJGUBudAk4OGkwKUp0LkiqT48Xm04U0mFFtVFZZN7B6zF+aySsLy+abYGhuVNYz
         Zbs18J2KyiJfyb7G5MIpaxJsHVS/0zkEERwXMGdg8bkEB+gj+XuvjZXTGiPZ6oBFmJau
         PTdD7kVh9iaq1ehmkRBxbo0rQSZpxxCvrRYlnJlWjq1yfzb6e5uuR7EhpJ0B9hU9fZE8
         hbMJK07iLJg4iBRRy2tEWwufp3mzCmcjHxnes0KzeUJFPGKFMR4T1Zedv1QTRfAqlFYk
         mYVg==
X-Forwarded-Encrypted: i=1; AHgh+RqWPBypsHnkwpI3Z8B8b9i4jhJIHMqaaeHFs53yMubEZFJ5qWfW1qv6X1dUeC4lC06/SZwlcodOey9Wq4j9@vger.kernel.org
X-Gm-Message-State: AFuF++kYle/+pEjRI6JNfCrHavZ9VDMkWkgo/i1NkLLIdRhRmwqWvZZw
	5HoJp4kwTXXI73ZhVHQhR8z9sEbq3HJSDDiqBLjOSBBfGWYTfGWR75/T1UFJ39INGX0oe1fr6UW
	pPEk/nofsHkesJvfvsBsC99xTsLs28kN9lsNhKbNhO08UU7W+HjXnLdwQe7ivZ5EGovzx
X-Gm-Gg: AR+sD12FoAMVXwR7rOH4pI0ow4Qp9CyNChO4SgxWlTFmGwomhZffI3PinfUO5lpGjVt
	TOsbtwWRAN4P1RWhEvoG/GX4br1K16B985cAv7mNT+MIcN3TQceqULetEqBqVXcM7O1jGC3Rq/3
	WV2EsjYbZ6SctKesfr8YR1s7QPmyNgsRfrMM93ZuiGZ606NiSfYHFteQ5fCzi/sgD4G2ipu5Nl4
	2LVK5k0AI1Q+Bi4/w49e1Rw+PN8ZIOB39dmykzggl5ASwwMaRgLZc8FTRcHbm1ea6D7QGlNFCAR
	N89MvxK1TY1CA1ImHdNchsUk/XPH2Y1s6xn/4EBfA+mhWup3i4wqFrHyyP2eX9j0FShtlN67csC
	Q5XwVOEqQMdpq6Q==
X-Received: by 2002:ac8:7e86:0:b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52fa1bbba1dmr136345531cf.13.1787912207715;
        Fri, 28 Aug 2026 03:16:47 -0700 (PDT)
X-Received: by 2002:ac8:7e86:0:b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52fa1bbba1dmr136344711cf.13.1787912207137;
        Fri, 28 Aug 2026 03:16:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm45373525e9.0.2026.08.28.03.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:16:46 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:16:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] phy: qualcomm: qmp-combo: Add DP COM v8 header
 and fix register layout
Message-ID: <x4mvoava7l3wftqspqdsc7f624hvkr3r2bmoettaqneaq57c4n@garrl4ikun4j>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX2EO4xlLigIbn
 Ajhej0LHheqngEJ+tng9CR4mojfHMcOiGa7O1iJtqIALLEiCIwmqE//LxC9dAY8GiBsoG+Hl2EC
 9LG66aFd1Wn0lNlPdbOBmZTnMVIgMq6rmvKVIBxOFijehmSttBF3e5I9dJY/qQVDxypnpvqNW6p
 DazGX0tdMVjbU6g6MUvFrd4E6C8vPUPsYt+baJ/sxhnEkf/EqB4jO5GfhRNXPdF0B8NXwKXLpWu
 ok9+rYxm0luhK/VSDj269VtWCDl+Me+DCq4Vb/E2dPtfSFBhxklEjfMKW2PqRjv+lGTwpaJJd+L
 GEgV2ubgJO29/dbUBgxD7hLh3xCM7kfVs8AXf1OlQ1LDu7MEUI+j8yAlULL4f8eIsBA9k8gaZIc
 8bC73dWqzu/LQ2EguFn2QrkNY8bkjsCeGvJwhD4SwqTKzLuRMnxwZKHTO/mZ002Eo4itKHzDkkz
 7F1PDSkyQ+k1h2kwSog==
X-Proofpoint-ORIG-GUID: AWfa-BK-ybIP3JZX9AkSjfbH06Jsr3n0
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a916011 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JKUcNUVehQOhZJPRnW0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX8+V/pedgdJNg
 n7GA3XCfjwaPUWBM2h9n/fro6G0RMjLPJSWNpOooEElqpfA1c//3Yk44/EBG9ooJh2cI2ryqftU
 uTSDWACuB0ED3IXJDkOzAPOh3tnjETY=
X-Proofpoint-GUID: AWfa-BK-ybIP3JZX9AkSjfbH06Jsr3n0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088

On 26-08-28 15:13:13, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the new DP-specific QSERDES COM v8 header file and update the
> register layout to use DP-specific status register offsets for
> C_READY_STATUS and CMN_STATUS registers.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
