Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7F8492502
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816519; cv=none; b=fA2hYCeMt4bi+VIitmRUVcn1YUQ/hl5r94YbEL0bnYRpIBcLi6DhBWKhE46ptpXWacB0ciC8UEVdO3Af8ggy19wPz9DIv3kTkBfZVfJ43V+IFDIrWusF/VJoBcK5P8o1MbzuXyKBTVNXXN7BaszcfTOjyznVqA7UIvLSB6jcN7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816519; c=relaxed/simple;
	bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1pQ1hYhpV69Lq58kSuoEgoQyeIhq7sxUZeI8yIuK29mStKgN2iJHc3a8rbR8fZyCxMUm3t/E7Y2Q7zHtHGtvsEDgDFLAnJHNpU+BACPkqjie8zUdQAfEOaEyFGbCqRHcmmXrivTPmTZREK1jKSCdwjegeq+9URQI4t4hOzQ0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=a18EyQSR; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="a18EyQSR"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533972e0cccso22996251cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791816517; x=1792421317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=a18EyQSRv8P0iZVz2cFyE4nGgHoZsQEXyx8UJuHZjpdM+7Qf5SQhhP2xNWAH0VYzQf
         /hoTlApssge3VsQ/ughGQGY0EAl62gOiNulQUtPZtIib5tqYAnuOwBaIFP2jom9NqxZs
         Js7D3KhLF4ajJ3qghgQYaFLUYxdFUOYcU8NGDBSHwvQLHuHt9cmGCYRlNuetRRfZ8cBx
         q41L4B7/xbYzABJqwB1ksDueQgP+fEt/7CCxbNCqmetPUJk8paMF210jlmlyzh2TH+i0
         IYmXPXhqQploSSM8bOgX4etNpNXQAiPb3ki2WHim7bolH4+nLgdpLKyQW/5qIdwwO02t
         h5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816517; x=1792421317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMfChKFNMXJzKzjmxiF7G9lPkPYxthEBjqQbKUTksMA=;
        b=MU2+uCT9UQYUFnnAIrkej93s7th2gjGVivgQ7/glIvn+6Be7/yS3RTcfBgx9NK9mVy
         wkdAP8n9FI0YUCKb0eB9RcAghBSvyUuwK6JD4V+uH+GVQ80dAwH1WbtGaC90U78Wpukg
         bbr3rNXId1y0A3KbcakLYG+NnzyKG2LnpN2CtyuuOK8LGDNKBZFjlGGqaebmHuO+d9BK
         8t+NYNeZzkBmvZBw2zDl+HVbr79eg9Pz6kQy+0gqSpKDsyzPHMNyrhPvgIjVV9AJi0ed
         7kKjnZWk/pGREe9jLG9UstGyz/HXJa2pDWteyZIV5L/ZaXDGu0lKBNch8iZHHxloy1Eu
         TIeg==
X-Forwarded-Encrypted: i=1; AKwUvBz2SNZoDV0pY8g+wPymWbg5nbda9TzMcEDdkWkyx35jQA6DV8eMe7dDCPzCjmJ4jyfVtNa78H4FZ2NS0Jpm@vger.kernel.org
X-Gm-Message-State: AFq9FYJtUC0bQIrtBC6vQa9+u8mSS2q4/4SgL7KudZ1rNhpkqQQksI82
	Ltp8CAQqnms02Tnx9ZX+WPY7MOljtX4Pae7IZuo03SQCal/WS1BOR9KExIOR8DGQumk=
X-Gm-Gg: AYBFou3nILjCQdWbLOkzIz4U4ABn5pQH5Gh0t5FHOGditTxTc3r88kWR3jW4WD7Rk3p
	62xejN6fZXW0e1gIuKAwxPDjr+tNwkJOFQ1JrWWvDspfXoLmqAs68NP5grKRK9rdxv+qQoWLt89
	3/owWQz5olYdo1d0241rymnawClfHKD66mi4BiPRnu0xjt/81GLcj4i+9VoQe/Te1YkFnlPGG4y
	it6udQe3paDYTS+RZFSyt5Ou9tCE5Icl+FaKXfgpKIOvzyXZkVdka2OPpu8CX2UEk+RbhfB4qVz
	8oPZ99g/+v74e7hP8L8Q6/9FZg0rjqcnlOJGY7LOpHZw5JHNPh1uhcgsqi71Mi/YY5IeE0qhr3X
	3s1E567wro8egl3xy7DiGEqiiYxNiDo2RakSpzCzJVdB8Yr1pwb8siw6HuaV7STt+XxVy3IqV4I
	Ai14R63lrpDW7CzHD2u31yDCNfAfC9bzS3p4fBm8aihOp+bgOPfXGD4yp4KI5ZRr6cnU51Aha90
	FOBUkalyxefAlHYidzEdTPvll+SQNJ0VgvDWmgQwA==
X-Received: by 2002:a05:622a:4d93:b0:534:b7d1:cd1c with SMTP id d75a77b69052e-5359f498f75mr175097251cf.8.1791816516771;
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fa173sm80625631cf.7.2026.10.12.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:48:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGHKN-00000006Snm-0vE4;
	Mon, 12 Oct 2026 11:48:35 -0300
Date: Mon, 12 Oct 2026 11:48:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
	kevin.tian@intel.com, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261012144835.GG14213@ziepe.ca>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>

On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:

> Thank you for providing this level of detail in your cover letter. I've raised
> this issue with the engineering team in the past, but I've once again raised
> the issue with your in-depth analysis.

The main issue here is the driver can't use a normal MSI-X in the
normal MSI-X table.

"private" MSI registers don't work for virtualization.

Jason
